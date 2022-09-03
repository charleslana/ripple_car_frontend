import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/model/controllers/model_controller.dart';
import 'package:ripple_car_frontend/app/modules/model/services/model_service.dart';

class ModelBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(ModelService.new)
      ..lazyPut(
        () => ModelController(
          modelService: Get.find<ModelService>(),
        ),
      );
  }
}
