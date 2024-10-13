import 'package:flutter_boilerplate/app/state/app_start_state.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/feature/auth/repository/token_repository.dart';
import 'package:flutter_boilerplate/feature/auth/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_start_provider.g.dart';

@riverpod
class AppStartNotifier extends _$AppStartNotifier {
  late final TokenRepository _tokenRepository =
      ref.read(tokenRepositoryProvider);

  @override
  FutureOr<AppStartState> build() async {
    ref.onDispose(() {});

    final _authState = ref.watch(authNotifierProvider);

    if (_authState is AuthStateLoggedIn) {
      return const AppStartState.authenticated();
    }

    if (_authState is AuthStateLoggedOut) {
      return const AppStartState.unauthenticated();
    }

    final token = await _tokenRepository.fetchToken();
    if (token != null) {
      return const AppStartState.authenticated();
    } else {
      return const AppStartState.unauthenticated();
    }
  }
}
