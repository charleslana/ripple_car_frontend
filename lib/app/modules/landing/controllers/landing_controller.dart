import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/dtos/response_model.dart';
import 'package:ripple_car_frontend/app/modules/landing/services/landing_service.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class LandingController extends GetxController {
  LandingController({
    required this.landingService,
  });

  LandingService landingService = LandingService();
  RxString text = 'Validando versão...'.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    _fetchVersion();
    super.onInit();
  }

  Future<void> _fetchVersion() async {
    await landingService.getVersion().then(
      (value) {
        if (value != appVersion) {
          isLoading.value = false;
          text.value = 'Há um nova versão disponível!';
          return;
        }
        text.value = 'Validando conta...';
        Get.offAllNamed<dynamic>(AppRoutes.login);
      },
      onError: (dynamic error) {
        if (error is Map<String, dynamic>) {
          final ResponseModel response = ResponseModel.fromMap(error);
          text.value = response.message;
        }
        text.value = error;
        isLoading.value = false;
      },
    );
  }
}
