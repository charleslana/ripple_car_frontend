import 'package:flutter/material.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GaragePage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Text('GaragePage'),
      ),
    );
  }
}
