import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/auth/auth_store.dart';
import 'package:ripple_car_frontend/routes/app_routes.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthStore store = Get.find<AuthStore>();
    return store.isLogged.value
        ? null
        : const RouteSettings(name: AppRoutes.login);
  }
}
