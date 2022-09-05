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
                                          onPressed: () => _showStatusDialog(
                                              context, garageDetails),
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

  void _showStatusDialog(BuildContext context, GarageModel garageDetails) {
    showDialog<dynamic>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Status',
          textAlign: TextAlign.center,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.all(10),
        scrollable: true,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _showStatus(
              'Aceleração',
              garageDetails.car.acceleration.toString(),
            ),
            const Divider(),
            _showStatus(
              'Velocidade máxima',
              garageDetails.car.topSpeed.toString(),
            ),
            const Divider(),
            _showStatus(
              'Controle',
              garageDetails.car.control.toString(),
            ),
            const Divider(),
            _showStatus(
              'Peso',
              garageDetails.car.weight.toString(),
            ),
            const Divider(),
            _showStatus(
              'Dureza',
              garageDetails.car.toughness.toString(),
            ),
            const Divider(),
            _showStatus(
              'Potência',
              garageDetails.car.potency.toString(),
            ),
            const Divider(),
            _showStatus(
              'Nitro',
              garageDetails.car.nitro.toString(),
            ),
            const Divider(),
            _showStatus(
              'Raridade',
              garageDetails.car.rarity,
            ),
            const Divider(),
            _showStatus(
              'Classe',
              garageDetails.car.carClass,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: Get.back<dynamic>,
            child: const Text(
              'Fechar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showStatus(String text, String value) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      );
}
