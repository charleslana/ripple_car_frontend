import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/components/loop_animation.dart';
import 'package:ripple_car_frontend/app/components/side_bar.dart';
import 'package:ripple_car_frontend/app/modules/home/controllers/home_controller.dart';
import 'package:ripple_car_frontend/app/modules/home/models/home_model.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      drawer: const SideBar(),
      appBar: const CustomAppBar(
        title: 'Início',
        isBack: false,
      ),
      body: Stack(
        children: [
          const LoopAnimation(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
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
                                  newsIcon,
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
                                  giftIcon,
                                  height: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.obx(
                                (state) {
                                  final home = state as HomeModel;
                                  return Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 20,
                                    runSpacing: 20,
                                    children: [
                                      Column(
                                        children: [
                                          const Text('ID'),
                                          Text(home.id.toString()),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              home.name,
                                              style:
                                                  const TextStyle(fontSize: 30),
                                            ),
                                          ),
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
                      const Expanded(
                        flex: 3,
                        child: Center(
                          child: Text('Modos'),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FloatingActionButton(
                                  tooltip: 'Menu',
                                  heroTag: null,
                                  onPressed: () =>
                                      controller.key.currentState!.openDrawer(),
                                  child: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FloatingActionButton(
                                  tooltip: 'Garagem',
                                  heroTag: null,
                                  onPressed: () =>
                                      Get.toNamed<dynamic>(AppRoutes.garage),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
