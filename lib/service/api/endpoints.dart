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
  /* -------------------------------------------------------------------------- */
  /*                                     Pet                                    */
  /* -------------------------------------------------------------------------- */
  static const addPetPost = "api/parent/pet/add";
  static const petListGet = "api/parent/pet/list";
  static const removePetDelete = "api/parent/pet/delete/";
}
