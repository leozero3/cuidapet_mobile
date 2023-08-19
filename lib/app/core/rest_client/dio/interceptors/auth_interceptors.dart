import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/modules/core/auth/auth_store.dart';
import 'package:dio/dio.dart';

import 'package:cuidapet_mobile/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile/app/core/logger/app_logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthInterceptors extends Interceptor {
  final LocalStorage _localStorage;
  final AppLogger _log;
  final AuthStore _authStore;

  AuthInterceptors({
    required AppLogger log,
    required LocalStorage localStorage,
    required AuthStore authStore,
  })  : _log = log,
        _localStorage = localStorage,
        _authStore = authStore;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired =
        options.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] ?? false;

    if (authRequired) {
      
      final accessToken = await _localStorage
          .read<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY);

      if (accessToken == null) {
        _authStore.logout();
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Expire Token',
            type: DioExceptionType.cancel,
          ),
        );
      }

      options.headers['Authorization'] = accessToken;
    } else {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   super.onError(err, handler);
  // }
}
