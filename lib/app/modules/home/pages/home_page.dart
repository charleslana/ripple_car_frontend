import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/modules/login/controllers/login_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return Scaffold(
      appBar: const CustomAppBar(title: 'HomePage'),
      body: Center(
        child: OutlinedButton(
          onPressed: controller.logout,
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
