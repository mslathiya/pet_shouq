import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pet_shouq/service/repository/availability_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/controllers.dart';
import '../service/api/api_imports.dart';
import '../service/repository/repository.dart';
import 'app_preferences.dart';

Future<void> init() async {
  /* -------------------------------------------------------------------------- */
  /*                           Initialize preferences                           */
  /* -------------------------------------------------------------------------- */
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(preferences: Get.find()));
  Get.lazyPut(() => AppPreferences(preferences: sharedPreferences));

  /* -------------------------------------------------------------------------- */
  /*                       Initialize connectivity checker                      */
  /* -------------------------------------------------------------------------- */
  Get.lazyPut(
    () => NetworkInfo(
      netChecker: InternetConnectionChecker(),
    ),
  );

  final dio = await Get.find<ApiClient>().getClient();

  /* -------------------------------------------------------------------------- */
  /*                         Initialize main repository                         */
  /* -------------------------------------------------------------------------- */
  Get.lazyPut(
    () => ApiRepository(
      dio: dio,
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                         Initialize sub repositories                        */
  /* -------------------------------------------------------------------------- */
  Get.lazyPut(
    () => AuthRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
      preferences: Get.find(),
    ),
  );
  Get.lazyPut(
    () => PetRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
      preferences: Get.find(),
    ),
  );
  Get.lazyPut(
    () => NutritionRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => MedicationRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => DietLogRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => SpecialNoteRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => VaccinationRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => MedicalHistoryRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
    fenix: true,
  );

  Get.lazyPut(
    () => AvailabilityRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
    fenix: true,
  );

  /* -------------------------------------------------------------------------- */
  /*                          Initialize controllers
  */
  /* -------------------------------------------------------------------------- */
  Get.lazyPut(
    () => AuthController(
      repository: Get.find(),
      preferences: Get.find(),
    ),
  );
  Get.lazyPut(
    () => LoginController(
      repository: Get.find(),
    ),
  );
  Get.lazyPut(
    () => RegisterController(
      repository: Get.find(),
    ),
  );
  Get.lazyPut(
    () => EditParentProfileController(
      repository: Get.find(),
    ),
  );

  Get.lazyPut(
    () => PetController(
      repository: Get.find(),
    ),
  );
  Get.lazyPut(
    () => AvailabilityController(
      repository: Get.find(),
    ),
  );
}
