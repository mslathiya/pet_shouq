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
  /*                               Pet Medication                               */
  /* -------------------------------------------------------------------------- */
  static const medicationListGet = "api/parent/pet/medication/list/";
  static const medicationDetailGet = "api/parent/pet/medication/detail/";
  static const addMedicationPost = "api/parent/pet/medication/add";
  static const updateMedicationPost = "api/parent/pet/medication/update/";
  static const removeMedicationDelete = "api/parent/pet/medication/delete/";
}
