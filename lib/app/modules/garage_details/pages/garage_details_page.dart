import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/components/loop_animation.dart';
import 'package:ripple_car_frontend/app/modules/garage/models/garage_model.dart';
import 'package:ripple_car_frontend/app/modules/garage_details/controllers/garage_details_controller.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class GarageDetailsPage extends GetView<GarageDetailsController> {
  const GarageDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: CustomAppBar(
            title: controller.title.value,
            isHome: true,
          ),
          body: Stack(
            children: [
              const LoopAnimation(),
              Center(
                child: controller.obx(
                  (state) {
                    final garageDetails = state as GarageModel;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    getCarImage(garageDetails.car.image)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text('Nível ${garageDetails.level}'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  onEmpty: const Center(
                    child: Text('empty'),
                  ),
                  onError: (error) => Center(
                    child: Text(error.toString()),
                  ),
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
