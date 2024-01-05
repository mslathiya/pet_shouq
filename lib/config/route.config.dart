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
    default:
      throw ('This route name does not exit');
  }
}
