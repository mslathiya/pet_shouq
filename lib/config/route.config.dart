import 'package:get/get.dart';

import '../views/screens/screens.dart';

const String intro = '/intro';
const String login = '/login';
const String register = '/register';
const String verification = '/verification';
const String forgotPassword = '/forgotPassword';
const String changePassword = '/changePassword';
const String notifications = "/notifications";
const String contactUs = "/contactUs";
const String topAsked = "/topAsked";
const String privacyPolicy = "/privacyPolicy";
const String termsCondition = "/termsCondition";

//Specific for parent
const String editParentProfile = '/editParentProfile';
const String parentDashboard = "/parentDashboard";
const String doctorDetails = '/doctorDetails';
const String petDetails = '/petDetails';
const String addPet = '/addPet';
//medication
const String petMedication = "/petMedication";
const String petMedicationDetail = "/petMedicationDetail";
const String petAddMedication = "/petAddMedication";

//diet
const String petDiet = "/petDiet";
const String petDietDetail = "/petDietDetail";
const String petAddDiet = "/petAddDiet";

//nutrition
const String petNutrition = "/petNutrition";
const String petNutritionDetail = "/petNutritionDetail";
const String petAddNutrition = "/petAddNutrition";

//feeding Schedule
const String petFeedSchedule = "/petFeedSchedule";
const String petAddSchedule = "/petAddSchedule";

//special notes
const String petSpecialNotes = "/petSpecialNotes";
const String petAddSpecialNotes = "/petAddSpecialNotes";

//Appointment booking
const String petAppointment = "/petAppointment";
const String petBookingDetails = "/petBookingDetails";

//Specific for parent

//Specific for vet
const String vetDashboard = "/vetDashboard";
const String vetAppointmentDetail = "/vetAppointmentDetail";
const String vetEditProfile = "/vetEditProfile";
const String vetRegister = "/vetRegister";
const String vetAddAvailability = "/vetAddAvailability";
//Specific for vet

List<GetPage> generateRoute = [
  GetPage(
    name: intro,
    page: () => const OnBoarding(),
  ),
  GetPage(
    name: login,
    page: () => const Login(),
  ),
  GetPage(
    name: forgotPassword,
    page: () => const ForgotPassword(),
  ),
  GetPage(
    name: changePassword,
    page: () => const ChangePassword(),
  ),
  GetPage(
    name: register,
    page: () => const Register(),
  ),
  GetPage(
    name: verification,
    page: () => const Verification(),
  ),
  GetPage(
    name: notifications,
    page: () => const Notifications(),
  ),
  GetPage(
    name: contactUs,
    page: () => const ContactUs(),
  ),
  GetPage(
    name: topAsked,
    page: () => const TopAsked(),
  ),
  GetPage(
    name: privacyPolicy,
    page: () => const PrivacyPolicy(),
  ),
  GetPage(
    name: termsCondition,
    page: () => const TermsConditions(),
  ),

  /**Specific for parent**/
  GetPage(
    name: editParentProfile,
    page: () => const EditParentProfile(),
  ),
  GetPage(
    name: parentDashboard,
    page: () => const Dashboard(),
  ),
  GetPage(
    name: doctorDetails,
    page: () => const ClinicDetails(),
  ),
  GetPage(
    name: petDetails,
    page: () => const PetDetails(),
  ),
  GetPage(
    name: addPet,
    page: () => const AddNewPet(),
  ),
  /**
     * 
     * Medication
     * 
     */
  GetPage(
    name: petMedication,
    page: () => const PetMedication(),
  ),
  GetPage(
    name: petMedicationDetail,
    page: () => const MedicationDetails(),
  ),
  GetPage(
    name: petAddMedication,
    page: () => const AddMedication(),
  ),
  /**
       * 
       * Diet
       * 
       */
  GetPage(
    name: petDiet,
    page: () => const PetDiet(),
  ),
  GetPage(
    name: petDietDetail,
    page: () => const DietDetails(),
  ),
  GetPage(
    name: petAddDiet,
    page: () => const AddDiet(),
  ),
  /**
       * 
       * Nutrition
       * 
       */
  GetPage(
    name: petNutrition,
    page: () => const PetNutrition(),
  ),
  GetPage(
    name: petNutritionDetail,
    page: () => const NutritionDetails(),
  ),
  GetPage(
    name: petAddNutrition,
    page: () => const AddNutrition(),
  ),
  /**
       * 
       * Feeding Schedule
       * 
       */
  GetPage(
    name: petFeedSchedule,
    page: () => const FeedingSchedule(),
  ),
  GetPage(
    name: petAddSchedule,
    page: () => const AddSchedule(),
  ),

  /**
   * 
   * 
   * Special notes
   * 
   */
  GetPage(
    name: petSpecialNotes,
    page: () => const SpecialNotes(),
  ),
  GetPage(
    name: petAddSpecialNotes,
    page: () => const AddSpecialNote(),
  ),

  /**
       * 
       * Appointment booking
       * 
       */
  GetPage(
    name: petAppointment,
    page: () => const AppointmentList(),
  ),
  GetPage(
    name: petBookingDetails,
    page: () => const AppointmentDetails(),
  ),

  /**Specific for parent**/

  /**Specific for vet**/
  GetPage(
    name: vetDashboard,
    page: () => const VetDashboard(),
  ),
  GetPage(
    name: vetAppointmentDetail,
    page: () => const VetAppointmentDetail(),
  ),
  GetPage(
    name: vetEditProfile,
    page: () => const EditVetProfile(),
  ),
  GetPage(
    name: vetAddAvailability,
    page: () => const AddAvailability(),
  ),
  /**Specific for vet**/
];
