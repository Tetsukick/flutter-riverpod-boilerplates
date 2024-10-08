import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/feature/auth/repository/token_repository.dart';
import 'package:flutter_boilerplate/shared/http/api_response.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_boilerplate/shared/http/interceptor/dio_connectivity_request_retrier.dart';
import 'package:flutter_boilerplate/shared/http/interceptor/retry_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//part 'api_provider.g.dart';

enum ContentType { urlEncoded, json }

// @riverpod
// ApiProvider apiProvider(ApiProviderRef ref) {
//   return ApiProvider(ref);
// }

final apiProvider = Provider<ApiProvider>(ApiProvider.new);

class ApiProvider {
  ApiProvider(this._ref) {
    _dio = Dio();
    _dio.options.sendTimeout = const Duration(seconds: 10);
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: Connectivity(),
        ),
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }

    if (dotenv.env['BASE_URL'] != null) {
      _baseUrl = dotenv.env['BASE_URL']!;
    }
  }

  final Ref _ref;

  late Dio _dio;

  late final TokenRepository _tokenRepository =
  _ref.read(tokenRepositoryProvider);

  late String _baseUrl;

  Future<APIResponse> post(
      String path,
      dynamic body, {
        String? newBaseUrl,
        String? token,
        Map<String, String?>? query,
        ContentType contentType = ContentType.json,
        bool needRetry = true,
      }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = this._baseUrl + path;
    }
    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };
      final _appToken = await _tokenRepository.fetchToken();
      if (_appToken != null) {
        headers['Authorization'] = 'Bearer ${_appToken}';
      }
      //Sometime for some specific endpoint it may require to use different Token
      if (token != null) {
        headers['Authorization'] = 'Bearer ${token}';
      }

      final response = await _dio.post(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        try {
          if (response.data['data'] != null) {
            return APIResponse.success(response.data['data']);
          } else {
            return APIResponse.success(response.data);
          }
        } catch (e) {
          return APIResponse.success(response.data);
        }
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else

        // If 401, there's a possibility that the access token is expired
        // So we need to retry it once with new access token
        if (response.statusCode! == 401) {
          if (needRetry) {
            return await post(
              path,
              body,
              contentType: contentType,
              needRetry: false,
              newBaseUrl: newBaseUrl,
              query: query,
              token: token,
            );
          }
          return const APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['message'] != null) {
            return APIResponse.error(
              AppException.errorWithMessage(
                response.data['message'] as String ?? '',
              ),
            );
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
            AppException.errorWithMessage(
              e.response!.data['message'] as String,
            ),
          );
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message ?? ''));
    } on Error catch (e) {
      return APIResponse.error(
        AppException.errorWithMessage(e.stackTrace.toString()),
      );
    }
  }

  Future<APIResponse> get(
      String path, {
        String? newBaseUrl,
        String? token,
        Map<String, dynamic>? query,
        ContentType contentType = ContentType.json,
        bool needRetry = true,
      }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = this._baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final appToken = await _tokenRepository.fetchToken();
    if (appToken != null && appToken.token != null) {
      headers['Authorization'] = 'Bearer ${appToken.token}';
    }

    try {
      final response = await _dio.get(
        url,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );
      if (response == null) {
        return const APIResponse.error(AppException.error());
      }
      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        if (response.data['data'] != null) {
          return APIResponse.success(response.data['data']);
        } else {
          return APIResponse.success(response.data);
        }
      } else {
        if (response.statusCode! == 404) {
          return const APIResponse.error(AppException.connectivity());
        } else if (response.statusCode! == 401) {
          // If 401, there's a possibility that the access token is expired
          // So we need to retry it once with new access token
          if (needRetry) {
            return await get(
              path,
              contentType: contentType,
              needRetry: false,
              newBaseUrl: newBaseUrl,
              query: query,
              token: token,
            );
          }
          return const APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['error'] != null) {
            return APIResponse.error(
              AppException.errorWithMessage(
                response.data['error'] as String ?? '',
              ),
            );
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }
      return const APIResponse.error(AppException.error());
    }
  }

  Future<APIResponse> put(
      String path,
      dynamic body, {
        String? newBaseUrl,
        String? token,
        Map<String, String?>? query,
        ContentType contentType = ContentType.json,
        bool needRetry = true,
      }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = this._baseUrl + path;
    }
    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
        'referer': dotenv.env['BASE_WEB_URL_TEMP'] ?? '',
      };

      final appToken = await _tokenRepository.fetchToken();
      if (appToken != null && appToken.token != null) {
        headers['Authorization'] = 'Bearer ${appToken.token}';
      } else {}
      //Sometime for some specific endpoint it may require to use different Token
      if (token != null) {
        headers['Authorization'] = token;
      }

      debugPrint('headers for $path: $headers');

      final response = await _dio.put<Map<String,dynamic>>(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (response.statusCode! < 300) {
        if (response.data?['data'] != null) {
          return APIResponse.success(response.data?['data']);
        } else {
          return APIResponse.success(response.data);
        }
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else

        // If 401, there's a possibility that the access token is expired
        // So we need to retry it once with new access token
        if (response.statusCode! == 401) {
          if (needRetry) {
            await _tokenRepository.fetchToken();
            return await post(
              path,
              body,
              contentType: contentType,
              needRetry: false,
              newBaseUrl: newBaseUrl,
              query: query,
              token: token,
            );
          }
          return const APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data?['message'] != null) {
            return APIResponse.error(
              AppException.errorWithMessage(
                response.data?['message'] as String ?? '',
              ),
            );
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
            AppException.errorWithMessage(
              e.response!.data['message'] as String,
            ),
          );
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message ?? ''));
    } on Error catch (e) {
      return APIResponse.error(
        AppException.errorWithMessage(e.stackTrace.toString()),
      );
    }
  }
}
