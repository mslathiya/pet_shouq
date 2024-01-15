import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pet_shouq/service/repository/auth_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../controller/controllers.dart';
import '../service/api/api_imports.dart';

Future<void> init() async {
  //Initialize preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient());

  //Initialize connectivity checker
  Get.lazyPut(
    () => NetworkInfo(
      netChecker: InternetConnectionChecker(),
    ),
  );

  final dio = await Get.find<ApiClient>().getClient();

  //Initialize main repository
  Get.lazyPut(
    () => ApiRepository(
      dio: dio,
    ),
  );

  //Initialize sub repositories
  Get.lazyPut(
    () => AuthRepository(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
  );

  //Initialize controllers
  Get.lazyPut(
    () => LoginController(
      repository: Get.find(),
    ),
  );
}
