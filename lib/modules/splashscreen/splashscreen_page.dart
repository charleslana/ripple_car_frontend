import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/splashscreen/controller/splashscreen_controller.dart';
import 'package:ripple_car_frontend/utils/constants.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              height: 200,
              child: Image.asset(
                splashscreenImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
