import 'package:get/get.dart';
import 'package:ripple_car_frontend/auth/auth_guard.dart';
import 'package:ripple_car_frontend/modules/garage/binding/garage_binding.dart';
import 'package:ripple_car_frontend/modules/garage/garage_page.dart';
import 'package:ripple_car_frontend/modules/home/binding/home_binding.dart';
import 'package:ripple_car_frontend/modules/home/home_page.dart';
import 'package:ripple_car_frontend/modules/landing/binding/landing_binding.dart';
import 'package:ripple_car_frontend/modules/landing/landing_page.dart';
import 'package:ripple_car_frontend/modules/login/binding/login_binding.dart';
import 'package:ripple_car_frontend/modules/login/login_page.dart';
import 'package:ripple_car_frontend/modules/register/binding/register_binding.dart';
import 'package:ripple_car_frontend/modules/register/register_page.dart';
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
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.leftToRight,
      middlewares: [
        AuthGuard(),
      ],
    ),
    GetPage(
      name: AppRoutes.garage,
      page: () => const GaragePage(),
      binding: GarageBinding(),
      transition: Transition.rightToLeft,
      middlewares: [
        AuthGuard(),
      ],
    ),
  ];
}
