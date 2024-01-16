part of "api_imports.dart";

class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://petshouq.developerwork.in/public/';

  static const Duration receiveTimeout = Duration(milliseconds: 5000);

  static const Duration connectionTimeout = Duration(milliseconds: 15000);

  // Auth
  static const loginPost = "auth/login";
  static const forgotPasswordPost = "password/forgot";
}
