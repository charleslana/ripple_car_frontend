import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ripple_car_frontend/app/enums/toast_enum.dart';
import 'package:url_launcher/url_launcher.dart';

bool isName(String name) {
  return RegExp(r'^[a-zA-Z0-9]([_](?![_])|[a-zA-Z0-9]){1,18}[a-zA-Z0-9]$')
      .hasMatch(name);
}

void _closeToast() {
  if (Get.isSnackbarOpen) {
    Get.back<dynamic>();
    return;
  }
}

void closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<void> launchDiscord() async {
  final Uri url = Uri.parse('https://flutter.dev');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

void showLoading() {
  _closeToast();
  Get.dialog<dynamic>(
    WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ),
    barrierDismissible: false,
  );
}

void showToast(String message, ToastEnum toast) {
  _closeToast();
  Get.rawSnackbar(
    messageText: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: toast == ToastEnum.error ? Colors.red : Colors.green[900],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    reverseAnimationCurve: Curves.easeOut,
    borderRadius: 10,
    margin: const EdgeInsets.all(15),
    animationDuration: const Duration(),
    duration: const Duration(seconds: 4),
  );
}

String isBroken({required bool broken}) {
  if (broken) {
    return 'Quebrado';
  }
  return 'Funcionando';
}

String isBusted({required bool busted}) {
  if (busted) {
    return 'Preso';
  }
  return 'Livre';
}

String numberAbbreviation(dynamic myNumber) {
  final String stringNumber = myNumber.toString();
  final double doubleNumber = double.tryParse(stringNumber) ?? 0;
  final NumberFormat numberFormat = NumberFormat.compact();
  return numberFormat.format(doubleNumber);
}

List<Color> showColorsRarity(String rarity) {
  switch (rarity) {
    case 'COMMON':
      return [
        Colors.green,
        Colors.greenAccent,
        Colors.green.shade300,
      ];
    case 'RARE':
      return [
        Colors.blue,
        Colors.blueAccent,
        Colors.blue.shade300,
      ];
    case 'EPIC':
      return [
        Colors.purple,
        Colors.deepPurple,
        Colors.purple.shade300,
      ];
    case 'LEGENDARY':
      return [
        Colors.yellow,
        Colors.orangeAccent,
        Colors.yellow.shade300,
      ];
    case 'MYTHICAL':
      return [
        Colors.red,
        Colors.deepOrange,
        Colors.red.shade300,
      ];
    default:
      return [
        Colors.black,
        Colors.black,
        Colors.black,
      ];
  }
}
