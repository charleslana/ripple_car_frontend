import 'package:get/get.dart';
import 'package:ripple_car_frontend/auth/auth_store.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AuthStore.new);
  }
}
