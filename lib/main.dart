import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/routes/app_pages.dart';
import 'package:ripple_car_frontend/routes/app_routes.dart';
import 'package:ripple_car_frontend/themes/colors_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ripple Car',
      theme: ThemeColor().themeData,
      initialRoute: AppRoutes.splashscreen,
      getPages: AppPages.pages,
    );
  }
}
