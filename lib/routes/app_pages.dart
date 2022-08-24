import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/landing/binding/landing_binding.dart';
import 'package:ripple_car_frontend/modules/landing/landing_page.dart';
import 'package:ripple_car_frontend/modules/splashscreen/binding/splashscreen_binding.dart';
import 'package:ripple_car_frontend/modules/splashscreen/splashscreen_page.dart';
import 'package:ripple_car_frontend/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => const SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingPage(),
      binding: LandingBinding(),
      transition: Transition.leftToRight,
    ),
  ];
}
