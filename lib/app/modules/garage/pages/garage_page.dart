import 'package:flutter/material.dart';
import 'package:ripple_car_frontend/app/components/custom_app_bar.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'GaragePage'),
      body: Center(
        child: Text('GaragePage'),
      ),
    );
  }
}
