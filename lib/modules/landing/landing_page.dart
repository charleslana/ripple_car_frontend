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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(landingImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black87,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Align(
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
                                style: poppinsRegular()
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'By Charles Lana',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'v.$appVersion',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
