import 'package:get/get.dart';
import 'package:ripple_car_frontend/modules/register/models/register_model.dart';
import 'package:ripple_car_frontend/modules/register/service/register_service.dart';

class RegisterController extends GetxController {
  RegisterController({
    required this.registerService,
  });

  RegisterService registerService = RegisterService();
  RxBool isLoading = false.obs;
  RxBool isObscuredPassword = true.obs;
  RxBool isObscuredConfirmPassword = true.obs;

  Future<void> register(RegisterModel register) async {}
}
