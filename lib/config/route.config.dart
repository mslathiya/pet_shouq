import 'package:flutter/material.dart';
import 'package:pet_shouq/views/screens/screens.dart';

const String intro = 'intro';
const String login = 'login';
const String register = 'register';
const String verification = 'verification';
const String forgotPassword = 'forgotPassword';
const String changePassword = 'changePassword';

const String parentDashboard = "parentDashboard";
const String doctorDetails = 'doctorDetails';
const String petDetails = 'petDetails';
const String addPet = 'addPet';
const String editParentProfile = 'editParentProfile';

//medication
const String petMedication = "petMedication";
const String petMedicationDetail = "petMedicationDetail";
const String petAddMedication = "petAddMedication";

//diet
const String petDiet = "petDiet";
const String petDietDetail = "petDietDetail";
const String petAddDiet = "petAddDiet";

//nutrition
const String petNutrition = "petNutrition";
const String petNutritionDetail = "petNutritionDetail";
const String petAddNutrition = "petAddNutrition";

Route<dynamic> generateRoute(RouteSettings settings) {
  final routeName = settings.name;
  switch (routeName) {
    case intro:
      return MaterialPageRoute(
        builder: (context) => const OnBoarding(),
      );
    case login:
      return MaterialPageRoute(
        builder: (context) => const Login(),
      );
    case forgotPassword:
      return MaterialPageRoute(
        builder: (context) => const ForgotPassword(),
      );
    case changePassword:
      return MaterialPageRoute(
        builder: (context) => const ChangePassword(),
      );
    case register:
      return MaterialPageRoute(
        builder: (context) => const Register(),
      );
    case verification:
      return MaterialPageRoute(
        builder: (context) => const Verification(),
      );
    case parentDashboard:
      return MaterialPageRoute(
        builder: (context) => const ParentDashboard(),
      );
    case doctorDetails:
      return MaterialPageRoute(
        builder: (context) => const ClinicDetails(),
      );
    case petDetails:
      return MaterialPageRoute(
        builder: (context) => const PetDetails(),
      );
    case addPet:
      return MaterialPageRoute(
        builder: (context) => const AddNewPet(),
      );
    case editParentProfile:
      return MaterialPageRoute(
        builder: (context) => const EditParentProfile(),
      );
    /**
     * 
     * Medication
     * 
     */
    case petMedication:
      return MaterialPageRoute(
        builder: (context) => const PetMedication(),
      );
    case petMedicationDetail:
      return MaterialPageRoute(
        builder: (context) => const MedicationDetails(),
      );
    case petAddMedication:
      return MaterialPageRoute(
        builder: (context) => const AddMedication(),
      );
    /**
       * 
       * Diet
       * 
       */
    case petDiet:
      return MaterialPageRoute(
        builder: (context) => const PetDiet(),
      );
    case petDietDetail:
      return MaterialPageRoute(
        builder: (context) => const DietDetails(),
      );
    case petAddDiet:
      return MaterialPageRoute(
        builder: (context) => const AddDiet(),
      );
    /**
       * 
       * Nutrition
       * 
       */
    case petNutrition:
      return MaterialPageRoute(
        builder: (context) => const PetNutrition(),
      );
    case petNutritionDetail:
      return MaterialPageRoute(
        builder: (context) => const NutritionDetails(),
      );
    case petAddNutrition:
      return MaterialPageRoute(
        builder: (context) => const AddNutrition(),
      );
    default:
      throw ('This route name does not exit');
  }
}
