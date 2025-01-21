import 'package:get/get.dart';
import 'package:greemgrocer/src/pages/auth/sign_in_screen.dart';
import 'package:greemgrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greemgrocer/src/pages/base/base_screen.dart';
import 'package:greemgrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PagesRoutes.splashRoute, page: () => const SplashScreen()),
    GetPage(name: PagesRoutes.signInRoute, page: () => SignInScreen()),
    GetPage(name: PagesRoutes.signupRoute, page: () => SignUpScreen()),
    GetPage(name: PagesRoutes.baseRoute, page: () => const BaseScreen()),
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/splash';
  static const String signInRoute = '/signin';
  static const String signupRoute = '/signup';
  static const String baseRoute = '/';
}
