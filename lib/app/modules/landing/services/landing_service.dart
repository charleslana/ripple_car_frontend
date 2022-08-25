import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class LandingService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = apiBaseUrl;
    super.onInit();
  }

  Future<String> getVersion() async {
    final response = await get<dynamic>('/version');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error('connection error');
      }
      return Future.error(response.bodyString.toString());
    }
    return response.body;
  }
}
