import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/register/models/register_model.dart';
import 'package:ripple_car_frontend/app/modules/register/services/register_service.dart';

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
