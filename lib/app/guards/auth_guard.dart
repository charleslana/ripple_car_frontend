import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final LoginController controller = Get.find<LoginController>();
    return controller.isLogged.value
        ? null
        : const RouteSettings(name: AppRoutes.login);
  }
}
