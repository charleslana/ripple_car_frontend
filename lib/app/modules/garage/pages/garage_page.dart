import 'package:flutter/material.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';
import 'package:ripple_car_frontend/app/components/loop_animation.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Garagem',
        isHome: true,
      ),
      body: Stack(
        children: const [
          LoopAnimation(),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text('Garagem'),
            ),
          ),
        ],
      ),
    );
  }
}
