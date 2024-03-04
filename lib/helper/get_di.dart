import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pet_shouq/controller/booking_history_controller.dart';
import 'package:pet_shouq/controller/pet_calender_controller.dart';
import 'package:pet_shouq/controller/pet_feeding_schedules_controller.dart';
import 'package:pet_shouq/controller/vet_data_controller.dart';
import 'package:pet_shouq/service/repository/booking_repository.dart';
import 'package:pet_shouq/service/repository/calender_list_repository.dart';
import 'package:pet_shouq/service/repository/pet_feeding_schedule_repository.dart';
import 'package:pet_shouq/service/repository/vet_data_repository.dart';

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
    () => VetDataController(
      repository: Get.find(),
    ),
  );
  Get.lazyPut(
    () => VetDataRepositoryImpl(
      apiService: Get.find(),
      networkInfo: Get.find(),
    ),
  );

  Get.lazyPut(
    () => BookingHistoryRepositoryImpl(
      apiService: Get.find(),
      networkInfo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => BookingHistoryController(
      repository: Get.find(),
    ),
  );

  Get.lazyPut(
    () => CalenderListRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
  );
  Get.lazyPut(
    () => PetCalenderController(
      repository: Get.find(),
    ),
  );
  Get.lazyPut(
    () => PetFeedingSchedulesRepositoryImpl(
      networkInfo: Get.find(),
      apiService: Get.find(),
    ),
  );
  Get.lazyPut(
        () => PetFeedingSchedulesController(
      repository: Get.find(),
    ),
  );
}
