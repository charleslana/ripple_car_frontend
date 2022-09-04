import 'package:ripple_car_frontend/app/modules/garage/models/garage_model.dart';
import 'package:ripple_car_frontend/app/services/request_service.dart';

class GarageDetailsService extends RequestService {
  Future<GarageModel> getCarDetails(int id) async {
    final response = await get<dynamic>('/user/car/$id');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection error');
      }
      return Future.error(response.body);
    }
    return GarageModel.fromMap(response.body);
  }
}
