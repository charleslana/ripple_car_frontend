import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/garage/service/garage_service.dart';

class GarageController extends GetxController {
  GarageController({
    required this.garageService,
  });

  GarageService garageService = GarageService();
  RxBool isLoading = false.obs;
}
