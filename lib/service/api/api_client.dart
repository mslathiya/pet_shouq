// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "api_imports.dart";

class ApiClient {
  late Dio dio;
  AppPreferences preferences;

  ApiClient({
    required this.preferences,
  });

  Future<Dio> getClient() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseURL,
        connectTimeout: Endpoints.connectionTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          "Accept": "application/json"
        },
        // validateStatus: (_) => true,
        validateStatus: (int? status) {
          return status != null;
          // return status != null && status >= 200 && status < 300;
        },
      ),
    );
    dio.interceptors.addAll([
      AuthorizationInterceptor(preferences: preferences),
      LoggerInterceptor(),
      ErrorInterceptor(),
    ]);
    return dio;
  }
}
