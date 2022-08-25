import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/home/service/home_service.dart';

class HomeController extends GetxController {
  HomeController({
    required this.homeService,
  });

  HomeService homeService = HomeService();
  RxBool isLoading = false.obs;
}
