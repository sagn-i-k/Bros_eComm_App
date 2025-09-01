import 'package:bro_app/app/modules/BottomNavBar/view/bottomNavBar.dart';
import 'package:bro_app/app/modules/SignUp/binding/signup_binding.dart';
import 'package:get/get.dart';
import '../Modules/Splash/binding/splash_binding.dart';
import '../Modules/Splash/view/splash_screen.dart';
import '../modules/BottomNavBar/binding/bottomNavBar_binding.dart';
import '../modules/SignUp/view/signup_screen.dart';
import '../modules/Signin/binding/signin_binding.dart';
import '../modules/Signin/view/signin_screen.dart';


class RoutesManager {
  static const splash = '/splash';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const bottomNavBar = '/bottomNavBar';

  static final getPages = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: signIn,
      page: () => SigninScreen(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: signUp,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: bottomNavBar,
      page: () => BottomNavBar(),
      binding: BottomNavBarBinding(),
    ),
  ];
}