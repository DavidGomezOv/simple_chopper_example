import 'package:simple_chopper_example/src/core/base/base_view_model.dart';
import 'package:simple_chopper_example/src/core/di/app_component.dart';
import 'package:simple_chopper_example/src/home/model/item_list_model.dart';
import 'package:simple_chopper_example/src/home/services/home_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends AppBaseViewModel {
  final _homeService = locator<HomeService>();

  List<ItemListModel> get itemList => _homeService.itemListValue.value;

  bool get loading => _homeService.loadingReactiveValue.value;

  HomeViewModel() {
    getItemList();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _homeService,
      ];

  void getItemList() {
    _homeService.getItemList().catchError((error) {
      errorApiResponse(error);
    });
  }
}
