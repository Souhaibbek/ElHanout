import 'package:elhanout/logic/binding/authbinding.dart';
import 'package:elhanout/logic/binding/layoutbinding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:elhanout/view/auth/login.dart';
import 'package:elhanout/view/auth/signup.dart';
import 'package:elhanout/view/screens/layout/Layout.dart';
import 'package:elhanout/view/screens/welcome.dart';

import '../view/auth/forgetpass.dart';

class RoutesList {
  static const initialRoute = AppRoutes.welcomeScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.layoutScreen,
      page: () => LayoutScreen(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class AppRoutes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const layoutScreen = '/layoutScreen';
  static const forgetScreen = '/forgetScreen';

}
