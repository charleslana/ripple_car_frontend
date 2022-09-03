import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/models/pageable_content_model.dart';
import 'package:ripple_car_frontend/app/models/response_model.dart';
import 'package:ripple_car_frontend/app/modules/garage/services/garage_service.dart';

class GarageController extends GetxController
    with StateMixin<PageableContentModel> {
  GarageController({
    required this.garageService,
  });

  GarageService garageService = GarageService();

  @override
  void onInit() {
    _fetchAllCars();
    super.onInit();
  }

  Future<void> _fetchAllCars() async {
    change(null, status: RxStatus.loading());
    await garageService.getAllCars().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic error) {
      if (error is Map<String, dynamic>) {
        final ResponseModel response = ResponseModel.fromMap(error);
        change(null, status: RxStatus.error(response.message));
        return;
      }
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
