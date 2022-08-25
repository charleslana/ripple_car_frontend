import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/garage/services/garage_service.dart';

class GarageController extends GetxController {
  GarageController({
    required this.garageService,
  });

  GarageService garageService = GarageService();
  RxBool isLoading = false.obs;
}
