import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/models/response_model.dart';
import 'package:ripple_car_frontend/app/modules/garage/models/garage_model.dart';
import 'package:ripple_car_frontend/app/modules/garage_details/services/garage_details_service.dart';

class GarageDetailsController extends GetxController
    with StateMixin<GarageModel> {
  GarageDetailsController({
    required this.garageDetailsService,
    required this.userCarId,
  });

  GarageDetailsService garageDetailsService = GarageDetailsService();
  int userCarId;

  RxString title = 'Detalhes do carro'.obs;

  @override
  void onInit() {
    _fetchCarDetails();
    super.onInit();
  }

  Future<void> _fetchCarDetails() async {
    change(null, status: RxStatus.loading());
    await garageDetailsService.getCarDetails(userCarId).then((result) {
      change(result, status: RxStatus.success());
      title.value = result.car.name;
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
