import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/components/loop_animation.dart';
import 'package:ripple_car_frontend/app/modules/home/controllers/home_controller.dart';
import 'package:ripple_car_frontend/app/modules/home/models/home_model.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Início',
        isBack: false,
      ),
      body: Stack(
        children: [
          const LoopAnimation(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {},
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcATop,
                  ),
                  child: Image.asset(
                    newsIcon,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {},
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcATop,
                  ),
                  child: Image.asset(
                    giftIcon,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.obx(
                    (state) {
                      final home = state as HomeModel;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('ID'),
                              Text(home.id.toString()),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('E-mail'),
                              Text(home.email),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Nome'),
                              Text(home.name),
                            ],
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
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      garageIcon,
                      height: 24,
                    ),
                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      carPiecesIcon,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      carShopIcon,
                      height: 24,
                    ),
                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      rankingIcon,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
