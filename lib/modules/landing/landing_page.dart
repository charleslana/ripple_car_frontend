import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/landing/controller/landing_controller.dart';
import 'package:ripple_car_frontend/themes/app_text_theme.dart';
import 'package:ripple_car_frontend/themes/colors_theme.dart';
import 'package:ripple_car_frontend/utils/constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController controller = Get.find<LandingController>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(landingImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Obx(
              () => SizedBox(
                width: double.infinity,
                height: 100,
                child: Card(
                  elevation: 0,
                  color: ThemeColor.primaryDarkGrey.withOpacity(0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.isLoading.value) ...[
                        const LinearProgressIndicator(),
                        const SizedBox(height: 10),
                      ],
                      Text(
                        controller.text.value,
                        textAlign: TextAlign.center,
                        style: poppinsRegular().copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
