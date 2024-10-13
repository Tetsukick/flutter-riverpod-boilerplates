import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/shared/http/interceptor/dio_connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {

  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier,
  });
  final DioConnectivityRequestRetrier requestRetrier;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_shouldRetry(err)) {
      try {
        requestRetrier.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        log(e.toString());
      }
    }
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout &&
        err.error != null &&
        err.error is SocketException;
  }
}
