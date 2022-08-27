import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/landing/services/landing_service.dart';
import 'package:ripple_car_frontend/app/modules/login/controllers/login_controller.dart';
import 'package:ripple_car_frontend/app/modules/login/models/login_credential_model.dart';
import 'package:ripple_car_frontend/app/modules/login/services/login_service.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';
import 'package:ripple_car_frontend/app/services/encrypt_service.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class LandingController extends GetxController {
  LandingController({
    required this.landingService,
    required this.loginService,
  });

  LandingService landingService = LandingService();
  LoginService loginService = LoginService();

  RxString text = 'landing.page.version'.tr.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    _fetchVersion();
    super.onInit();
  }

  Future<void> _fetchVersion() async {
    await landingService.getVersion().then(
      (result) async {
        if (result != appVersion) {
          isLoading.value = false;
          text.value = 'Há um nova versão disponível!';
          return;
        }
        text.value = 'Validando conta...';
        await tryLogin();
      },
      onError: (dynamic error) {
        text.value = error;
        isLoading.value = false;
      },
    );
  }

  Future<void> tryLogin() async {
    final Map<String, dynamic>? getLoginStorage = loginService.readLogin();
    if (getLoginStorage == null) {
      await Get.offAllNamed<dynamic>(AppRoutes.login);
      return;
    }
    final EncryptService encryptService = EncryptService();
    final LoginCredentialModel login = LoginCredentialModel();
    login
      ..fromMap(getLoginStorage)
      ..setEmail(encryptService.decrypt(login.email.value))
      ..setPassword(encryptService.decrypt(login.password.value));
    await loginService.login(login).then(
      (result) {
        final LoginController controller = Get.find<LoginController>();
        controller.isLogged.value = true;
        loginService.saveAuth(result);
        Get.offAllNamed<dynamic>(AppRoutes.home);
      },
      onError: (dynamic error) {
        Get.back<dynamic>();
        if (error is Map<String, dynamic>) {
          Get.offAllNamed<dynamic>(AppRoutes.login);
          return;
        }
        text.value = error;
        isLoading.value = false;
      },
    );
  }
}
