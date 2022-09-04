import 'package:ripple_car_frontend/app/modules/home/models/home_model.dart';
import 'package:ripple_car_frontend/app/services/request_service.dart';

class HomeService extends RequestService {
  Future<HomeModel> getUserDetails() async {
    final response = await get<dynamic>('/user/details');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection error');
      }
      return Future.error(response.body);
    }
    return HomeModel.fromMap(response.body);
  }
}
