import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ripple_car_frontend/app/models/pageable_content_model.dart';
import 'package:ripple_car_frontend/app/models/response_model.dart';
import 'package:ripple_car_frontend/app/modules/garage/models/garage_model.dart';
import 'package:ripple_car_frontend/app/modules/garage/services/garage_service.dart';

class GarageController extends GetxController
    with StateMixin<PageableContentModel> {
  GarageController({
    required this.garageService,
  });

  GarageService garageService = GarageService();

  final int _pageSize = 10;
  final PagingController<int, GarageModel> pagingController =
      PagingController(firstPageKey: 0);

  late PageableContentModel _result;

  @override
  void onInit() {
    _fetchAllCars();
    pagingController.addPageRequestListener(_fetchPage);
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchAllCars([int page = 0]) async {
    await garageService.getAllCars(page, _pageSize).then((result) {
      _result = result;
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

  Future<void> _fetchPage(int pageKey) async {
    try {
      await _fetchAllCars(pageKey);
      final newItems = _result.content
          .map((e) => GarageModel.fromMap(e as Map<String, dynamic>))
          .toList();
      final isLastPage = _result.last;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
        return;
      }
      final int nextPageKey = pageKey + 1;
      pagingController.appendPage(newItems, nextPageKey);
    } catch (error) {
      pagingController.error = error;
    }
  }
}
