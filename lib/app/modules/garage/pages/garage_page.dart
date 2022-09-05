import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/components/loop_animation.dart';
import 'package:ripple_car_frontend/app/models/pageable_content_model.dart';
import 'package:ripple_car_frontend/app/modules/garage/controllers/garage_controller.dart';
import 'package:ripple_car_frontend/app/modules/garage/models/garage_model.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';
import 'package:ripple_car_frontend/app/themes/app_text_theme.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';
import 'package:ripple_car_frontend/app/utils/functions.dart';

class GaragePage extends GetView<GarageController> {
  const GaragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Garagem',
          isHome: true,
        ),
        body: Stack(
          children: [
            const LoopAnimation(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.obx(
                      (state) {
                        final garage = state as PageableContentModel;
                        if (garage.content.isEmpty) {
                          return const Text(
                            'Nenhum carro encontrado',
                            textAlign: TextAlign.center,
                          );
                        }

                        return Expanded(
                          child: PagedGridView<int, GarageModel>(
                            showNewPageProgressIndicatorAsGridChild: false,
                            showNewPageErrorIndicatorAsGridChild: false,
                            showNoMoreItemsIndicatorAsGridChild: false,
                            pagingController: controller.pagingController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.65,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2,
                            ),
                            builderDelegate:
                                PagedChildBuilderDelegate<GarageModel>(
                              itemBuilder: (context, item, index) => InkWell(
                                onTap: () => Get.toNamed<dynamic>(
                                  AppRoutes.garageDetails,
                                  arguments: item.id,
                                ),
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors:
                                            showColorsRarity(item.car.rarity),
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  getCarImage(item.car.image)),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black,
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                stops: [0.7, 1],
                                              ),
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      item.car.name,
                                                      style: dosisRegular()
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      'Nível ${item.level}',
                                                      style: dosisRegular()
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
      ),
    );
  }
}
