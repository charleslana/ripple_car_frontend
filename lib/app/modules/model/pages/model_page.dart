import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/components/loop_animation.dart';
import 'package:ripple_car_frontend/app/modules/model/controllers/model_controller.dart';

class ModelPage extends GetView<ModelController> {
  const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Model',
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
                      return Container();
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
    );
  }
}
