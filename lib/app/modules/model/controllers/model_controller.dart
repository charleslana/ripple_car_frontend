import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/modules/model/services/model_service.dart';

class ModelController extends GetxController with StateMixin<String> {
  ModelController({
    required this.modelService,
  });

  ModelService modelService = ModelService();
}
