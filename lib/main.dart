import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ripple_car_frontend/app/i18n/i18n.dart';
import 'package:ripple_car_frontend/app/routes/app_pages.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';
import 'package:ripple_car_frontend/app/services/language_service.dart';
import 'package:ripple_car_frontend/app/themes/colors_theme.dart';

void main() async {
  await GetStorage.init();
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
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: I18n.translationsKeys,
      locale: LanguageService.getLocale(),
    );
  }
}
