import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/components/loop_animation.dart';
import 'package:ripple_car_frontend/app/modules/garage/models/garage_model.dart';
import 'package:ripple_car_frontend/app/modules/garage_details/controllers/garage_details_controller.dart';
import 'package:ripple_car_frontend/app/themes/app_text_theme.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';
import 'package:ripple_car_frontend/app/utils/functions.dart';

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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        getCarImage(garageDetails.car.image)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FloatingActionButton(
                                          tooltip: 'Build',
                                          heroTag: null,
                                          onPressed: () {},
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              Colors.white,
                                              BlendMode.srcATop,
                                            ),
                                            child: Image.asset(
                                              buildIcon,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                        FloatingActionButton(
                                          tooltip: 'Peças do carro',
                                          heroTag: null,
                                          onPressed: () {},
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              Colors.white,
                                              BlendMode.srcATop,
                                            ),
                                            child: Image.asset(
                                              carPartsIcon,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FloatingActionButton(
                                          tooltip: 'Status',
                                          heroTag: null,
                                          onPressed: () {},
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              Colors.white,
                                              BlendMode.srcATop,
                                            ),
                                            child: Image.asset(
                                              carStatusIcon,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                runSpacing: 20,
                                spacing: Get.width * 0.10,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        garageDetails.level.toString(),
                                        style: dosisRegular().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Nível',
                                        style: dosisRegular(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        garageDetails.experience.toString(),
                                        style: dosisRegular().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Experiência',
                                        style: dosisRegular(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        isBroken(broken: garageDetails.broken),
                                        style: dosisRegular().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Estado',
                                        style: dosisRegular(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        isBusted(busted: garageDetails.busted),
                                        style: dosisRegular().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        'Apto',
                                        style: dosisRegular(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Vender'),
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
