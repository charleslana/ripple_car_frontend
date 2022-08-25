import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/guards/auth_guard.dart';
import 'package:ripple_car_frontend/app/modules/garage/bindings/garage_binding.dart';
import 'package:ripple_car_frontend/app/modules/garage/pages/garage_page.dart';
import 'package:ripple_car_frontend/app/modules/home/bindings/home_binding.dart';
import 'package:ripple_car_frontend/app/modules/home/pages/home_page.dart';
import 'package:ripple_car_frontend/app/modules/landing/bindings/landing_binding.dart';
import 'package:ripple_car_frontend/app/modules/landing/pages/landing_page.dart';
import 'package:ripple_car_frontend/app/modules/login/bindings/login_binding.dart';
import 'package:ripple_car_frontend/app/modules/login/pages/login_page.dart';
import 'package:ripple_car_frontend/app/modules/register/bindings/register_binding.dart';
import 'package:ripple_car_frontend/app/modules/register/pages/register_page.dart';
import 'package:ripple_car_frontend/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:ripple_car_frontend/app/modules/splashscreen/pages/splashscreen_page.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';

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
