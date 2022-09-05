import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/models/response_model.dart';
import 'package:ripple_car_frontend/app/modules/home/models/home_model.dart';
import 'package:ripple_car_frontend/app/modules/home/services/home_service.dart';

class HomeController extends GetxController with StateMixin<HomeModel> {
  HomeController({
    required this.homeService,
  });

  HomeService homeService = HomeService();

  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void onInit() {
    _fetchUserDetails();
    super.onInit();
  }

  Future<void> _fetchUserDetails() async {
    change(null, status: RxStatus.loading());
    await homeService.getUserDetails().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic error) {
      if (error is Map<String, dynamic>) {
        final ResponseModel response = ResponseModel.fromMap(error);
        change(null, status: RxStatus.error(response.message));
        return;
      }
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
