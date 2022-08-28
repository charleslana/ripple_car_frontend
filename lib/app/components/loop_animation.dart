import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';
import 'package:simple_animations/simple_animations.dart';

class LoopAnimation extends StatelessWidget {
  const LoopAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: Stack(
        children: [
          LoopAnimationBuilder<double>(
            duration: const Duration(seconds: 10),
            tween: Tween(begin: 0, end: Get.width),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(value, 0),
                child: child,
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  repeat: ImageRepeat.repeat,
                  image: AssetImage(loopImage),
                ),
              ),
            ),
          ),
          LoopAnimationBuilder<double>(
            duration: const Duration(seconds: 10),
            tween: Tween(begin: -Get.width, end: 0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(value, 0),
                child: child,
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  repeat: ImageRepeat.repeat,
                  image: AssetImage(loopImage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
