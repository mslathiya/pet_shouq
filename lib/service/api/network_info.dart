part of "api_imports.dart";

class NetworkInfo {
  final InternetConnectionChecker netChecker;
  NetworkInfo({
    required this.netChecker,
  });

  Future<bool> get isConnected => netChecker.hasConnection;
}
