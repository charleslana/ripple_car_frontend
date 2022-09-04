import 'package:ripple_car_frontend/app/models/pageable_content_model.dart';
import 'package:ripple_car_frontend/app/services/request_service.dart';

class GarageService extends RequestService {
  Future<PageableContentModel> getAllCars([int page = 0, int size = 10]) async {
    final response = await get<dynamic>('/user/car?page=$page&size=$size');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection error');
      }
      return Future.error(response.body);
    }
    return PageableContentModel.fromMap(response.body);
  }
}
