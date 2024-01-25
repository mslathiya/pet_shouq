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
    if (isLoggedIn) {
      String token = await preferences.getAuthToken();
      options.headers['Authorization'] = token;
    }
    super.onRequest(options, handler);
  }
}
