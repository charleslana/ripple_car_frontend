import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/home/services/home_service.dart';

class HomeController extends GetxController {
  HomeController({
    required this.homeService,
  });

  HomeService homeService = HomeService();
  RxBool isLoading = false.obs;
}
