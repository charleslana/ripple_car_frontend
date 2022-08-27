import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/dtos/response_model.dart';
import 'package:ripple_car_frontend/app/enums/toast_enum.dart';
import 'package:ripple_car_frontend/app/modules/login/models/login_credential_model.dart';
import 'package:ripple_car_frontend/app/modules/login/services/login_service.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';
import 'package:ripple_car_frontend/app/utils/functions.dart';

class LoginController extends GetxController {
  LoginController({
    required this.loginService,
  });

  LoginService loginService = LoginService();
  RxBool isObscured = true.obs;
  RxBool isLogged = false.obs;

  Future<void> login(LoginCredentialModel credential) async {
    closeKeyboard();
    showLoading();
    await loginService.login(credential).then(
      (result) {
        isLogged.value = true;
        loginService
          ..saveLogin(credential)
          ..saveAuth(result);
        Get.offAllNamed<dynamic>(AppRoutes.home);
      },
      onError: (dynamic error) {
        Get.back<dynamic>();
        if (error is Map<String, dynamic>) {
          final ResponseModel response = ResponseModel.fromMap(error);
          showToast(response.message, ToastEnum.error);
          return;
        }
        showToast(error, ToastEnum.error);
      },
    );
  }

  void logout() {
    isLogged.value = false;
    loginService
      ..removeLogin()
      ..removeAuth();
    Get.offAllNamed<dynamic>(AppRoutes.login);
  }
}
