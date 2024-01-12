import 'package:flutter/material.dart';
import 'package:pet_shouq/views/screens/screens.dart';

const String intro = 'intro';
const String login = 'login';
const String register = 'register';
const String verification = 'verification';
const String forgotPassword = 'forgotPassword';
const String changePassword = 'changePassword';
const String notifications = "notifications";
const String contactUs = "contactUs";
const String topAsked = "topAsked";

//Specific for parent
const String editParentProfile = 'editParentProfile';
const String parentDashboard = "parentDashboard";
const String doctorDetails = 'doctorDetails';
const String petDetails = 'petDetails';
const String addPet = 'addPet';
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

//feeding Schedule
const String petFeedSchedule = "petFeedSchedule";
const String petAddSchedule = "petAddSchedule";

//Appointment booking
const String petAppointment = "petAppointment";
const String petBookingDetails = "petBookingDetails";
//Specific for parent

//Specific for vet
const String vetDashboard = "vetDashboard";
const String vetAppointmentDetail = "vetAppointmentDetail";
const String vetEditProfile = "vetEditProfile";
const String vetRegister = "vetRegister";
const String vetAddAvailability = "vetAddAvailability";
//Specific for vet

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
    case notifications:
      return MaterialPageRoute(
        builder: (context) => const Notifications(),
      );
    case contactUs:
      return MaterialPageRoute(
        builder: (context) => const ContactUs(),
      );
    case topAsked:
      return MaterialPageRoute(
        builder: (context) => const TopAsked(),
      );
    case editParentProfile:
      return MaterialPageRoute(
        builder: (context) => const EditParentProfile(),
      );

    /**Specific for parent**/
    case parentDashboard:
      return MaterialPageRoute(
        builder: (context) => const Dashboard(),
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
    /**
       * 
       * Feeding Schedule
       * 
       */
    case petFeedSchedule:
      return MaterialPageRoute(
        builder: (context) => const FeedingSchedule(),
      );
    case petAddSchedule:
      return MaterialPageRoute(
        builder: (context) => const AddSchedule(),
      );
    /**
       * 
       * Appointment booking
       * 
       */
    case petAppointment:
      return MaterialPageRoute(
        builder: (context) => const AppointmentList(),
      );
    case petBookingDetails:
      return MaterialPageRoute(
        builder: (context) => const AppointmentDetails(),
      );
    /**Specific for parent**/

    /**Specific for vet**/
    case vetDashboard:
      return MaterialPageRoute(
        builder: (context) => const VetDashboard(),
      );
    case vetAppointmentDetail:
      return MaterialPageRoute(
        builder: (context) => const VetAppointmentDetail(),
      );
    case vetEditProfile:
      return MaterialPageRoute(
        builder: (context) => const EditVetProfile(),
      );
    case vetAddAvailability:
      return MaterialPageRoute(
        builder: (context) => const AddAvailability(),
      );
    /**Specific for vet**/
    default:
      throw ('This route name does not exit');
  }
}
