part of "api_imports.dart";

class AuthorizationInterceptor extends Interceptor {
  AppPreferences preferences;
  AuthorizationInterceptor({
    required this.preferences,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    bool isLoggedIn = await preferences.getIsLoggedIn();
    if (_needAuthorizationHeader(options) && isLoggedIn) {
      String token = await preferences.getAuthToken();
      options.headers['Authorization'] = token;
    }
    super.onRequest(options, handler);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      return false;
    } else {
      return true;
    }
  }
}
