import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/modules/home/controllers/home_controller.dart';
import 'package:ripple_car_frontend/app/modules/home/models/home_model.dart';
import 'package:ripple_car_frontend/app/modules/login/controllers/login_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'HomePage',
        isBack: false,
      ),
      body: Center(
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
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: loginController.logout,
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
