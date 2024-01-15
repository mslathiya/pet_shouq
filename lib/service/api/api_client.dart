part of "api_imports.dart";

class ApiClient {
  late Dio dio;
  Future<Dio> getClient() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseURL,
        connectTimeout: Endpoints.connectionTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
        responseType: ResponseType.json,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
    );
    dio.interceptors.addAll([
      AuthorizationInterceptor(),
      LoggerInterceptor(),
    ]);
    return dio;
  }
}
