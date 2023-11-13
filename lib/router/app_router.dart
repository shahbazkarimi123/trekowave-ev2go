
import 'package:ev2go/data/models/signup_data.dart';
import 'package:ev2go/data/register_data.dart';
import 'package:ev2go/presentation/pages/recharge_request.dart';
import 'package:ev2go/presentation/screens/authentication/basic_details_screen.dart';
import 'package:ev2go/presentation/screens/authentication/id_proofs_screen.dart';
import 'package:ev2go/presentation/screens/authentication/login_screen.dart';
import 'package:ev2go/presentation/screens/authentication/rental_registration_form_screen.dart';
import 'package:ev2go/presentation/screens/authentication/welcome_screen.dart';
import 'package:ev2go/presentation/pages/navigation_page.dart';
import 'package:ev2go/presentation/widgets/device_details.dart';
import 'package:ev2go/presentation/widgets/error_page.dart';
import 'package:ev2go/presentation/widgets/package_details.dart';
import 'package:ev2go/presentation/widgets/package_end_details.dart';
import 'package:ev2go/presentation/widgets/package_state_details.dart';
import 'package:ev2go/presentation/widgets/terms_and_condition.dart';
import 'package:ev2go/presentation/widgets/user_details_page.dart';
import 'package:ev2go/presentation/widgets/vehicle_details.dart';
import 'package:flutter/material.dart';



class AppRouter{

  Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case LoginPage.LOGIN:
        return MaterialPageRoute(
          builder: (_)=>const LoginPage());
         
        
      case BasicDetails.BASICDETAILS :
        return MaterialPageRoute(builder: (_)=> const BasicDetails());
      
      case NavigationPage.HOME:
        return MaterialPageRoute(builder:(_)=> const NavigationPage());

      case WelcomePage.welcome:
        return MaterialPageRoute(builder: (_)=>const WelcomePage());

      case IdProofs.IDPROOFS:
        SignupData? signupArgument = routeSettings.arguments as SignupData?;
        return MaterialPageRoute(builder: (_)=>IdProofs(singUpData: signupArgument,));

      case RentalRegistrationForm.RENTALREGISTRATIONFORM:
      SignupData? signupArgument = routeSettings.arguments as SignupData?;
        return MaterialPageRoute(builder: (_)=> RentalRegistrationForm(signUpData: signupArgument,));
      
      case UserDetails.USERDETAILS:
        return MaterialPageRoute(builder: (_)=>const UserDetails());

      case DeviceDetails.DEVICE_DETAILS:
        return MaterialPageRoute(builder: (_)=>const DeviceDetails());

      case PackageDetails.PACKAGE_DETAILS:
        return MaterialPageRoute(builder: (_)=>const PackageDetails());

      case PackageStartDetails.PACKAGE_STATR_DETAILS:
        return MaterialPageRoute(builder: (_)=>const PackageStartDetails());

      case PackageEndDetails.PACKAGE_END_DETAILS:
        return MaterialPageRoute(builder: (_)=>const PackageEndDetails());

      case VehicleDetails.VEHICLE_DETAILS:
        return MaterialPageRoute(builder: (_)=>const VehicleDetails());
      
      case RechargeRequest.RECHARGEREQUEST:
        RechargeData? rechargeInfo = routeSettings.arguments as RechargeData;
        return MaterialPageRoute(builder: (_) => RechargeRequest(rechargeData: rechargeInfo,));
      case TermsAndConditions.TERMS_AND_CONDITIONS:
        return MaterialPageRoute(builder: (_)=> const TermsAndConditions());
      
      default:
        return MaterialPageRoute(builder: (_)=>const ErrorPage());
    }
    
  }
}