import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/login/controller/login_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomePage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: controller.logout,
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
