part of "api_imports.dart";

class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://petshouq.developerwork.in/public/';

  static const Duration receiveTimeout = Duration(minutes: 5);

  static const Duration connectionTimeout = Duration(minutes: 5);

  /* -------------------------------------------------------------------------- */
  /*                                    Auth                                    */
  /* -------------------------------------------------------------------------- */
  static const loginPost = "auth/login";
  static const registerPetPost = "auth/pet-parents/register";
  static const forgotPasswordPost = "password/forgot";
  static const profileGet = "api/profile";
  static const updateParentProfilePost = "api/parent/update/profile";
  static const changePasswordPost = "api/change-password";
  static const parentFieldValidationPost =
      "auth/pet-parents/register-validation-check";

  /* -------------------------------------------------------------------------- */
  /*                                     Pet                                    */
  /* -------------------------------------------------------------------------- */
  static const addPetPost = "api/parent/pet/add";
  static const editPetPost = "api/parent/pet/update/";
  static const petListGet = "api/parent/pet/list";
  static const removePetDelete = "api/parent/pet/delete/";
  static const petDetailGet = "api/parent/pet/detail/";

  /* -------------------------------------------------------------------------- */
  /*                            Pet Nutrition/Feeding                           */
  /* -------------------------------------------------------------------------- */
  static const nutritionListGet = "api/parent/pet/nutrition/list/";
  static const nutritionDetailGet = "api/parent/pet/nutrition/detail/";
  static const addNutritionPost = "api/parent/pet/nutrition/add";
  static const updateNutritionPost = "api/parent/pet/nutrition/update/";
  static const removeNutritionDelete = "api/parent/pet/nutrition/delete/";

  /* -------------------------------------------------------------------------- */
  /*                            Pet Side Vet Listing                            */
  /* -------------------------------------------------------------------------- */
  static const vetDashboardListGet = "api/parent/dashboard/nearby-vet-list?";
  static const vetDetailsGet = "api/parent/dashboard/vet-detail/";
  static const vetSlotListGet = "api/parent/appointment/get-slot-list?";
  static const bookSlotPost = "api/parent/appointment/book-slot";
  // static const bookSlotPost = "api/parent/appointment/book-slot";

  /* -------------------------------------------------------------------------- */
  /*                               Pet Medication                               */
  /* -------------------------------------------------------------------------- */
  static const medicationListGet = "api/parent/pet/medication/list/";
  static const medicationDetailGet = "api/parent/pet/medication/detail/";
  static const addMedicationPost = "api/parent/pet/medication/add";
  static const updateMedicationPost = "api/parent/pet/medication/update/";
  static const removeMedicationDelete = "api/parent/pet/medication/delete/";
  static const medicationTypeListGet = "api/medication-type-list";

  /* -------------------------------------------------------------------------- */
  /*                                Pet Diet Log                                */
  /* -------------------------------------------------------------------------- */
  static const dietListGet = "api/parent/pet/diet-log/list/";
  static const dietDetailGet = "api/parent/pet/diet-log/detail/";
  static const addDietPost = "api/parent/pet/diet-log/add";
  static const updateDietPost = "api/parent/pet/diet-log/update/";
  static const removeDietDelete = "api/parent/pet/diet-log/delete/";

  /* -------------------------------------------------------------------------- */
  /*                              Pet Special Notes                             */
  /* -------------------------------------------------------------------------- */
  static const addPetSpecialNote = "api/parent/pet/special-need/";

  /* -------------------------------------------------------------------------- */
  /*                               Pet Vaccination                              */
  /* -------------------------------------------------------------------------- */
  static const vaccinationListGet = "api/parent/pet/vaccination/list/";
  static const vaccinationDetailGet = "api/parent/pet/vaccination/detail/";
  static const addVaccinationPost = "api/parent/pet/vaccination/add";
  static const updateVaccinationPost = "api/parent/pet/vaccination/update/";
  static const removeVaccinationDelete = "api/parent/pet/vaccination/delete/";

  /* -------------------------------------------------------------------------- */
  /*                             pet medical history                            */
  /* -------------------------------------------------------------------------- */

  static const medicalHistoryListGet = "api/parent/pet/medical-history/list/";
  static const medicalHistoryDetailGet =
      "api/parent/pet/medical-history/detail/";
  static const addMedicalHistoryPost = "api/parent/pet/medical-history/add";
  static const updateMedicalHistoryPost =
      "api/parent/pet/medical-history/update/";
  static const removeMedicalHistoryDelete =
      "api/parent/pet/medical-history/delete/";

/* -------------------------------------------------------------------------- */
/*                             pet booking history                            */
/* -------------------------------------------------------------------------- */

  static const bookingHistoryGet = "api/parent/appointment/list?";
  static const bookingHistoryDetailsGet = "api/parent/appointment/detail/";
  static const rescheduleAppointmentPost = "api/parent/appointment/reschedule-booking-slot";

/* -------------------------------------------------------------------------- */
/*                             pet calender                                   */
/* -------------------------------------------------------------------------- */

  static const calenderListGet = "api/parent/calendar/list";

/* -------------------------------------------------------------------------- */
/*                             pet feeding schedule                                   */
/* -------------------------------------------------------------------------- */

  static const feedingScheduleGet = "api/parent/pet/feeding-schedules/list/";
  static const addSchedulePost = "api/parent/pet/feeding-schedules/add";


}
