import 'package:injectable/injectable.dart';
import 'package:simple_chopper_example/src/core/base/base_reactive_service.dart';
import 'package:simple_chopper_example/src/core/converters/exception/api_exception.dart';
import 'package:simple_chopper_example/src/core/either/api_result.dart';
import 'package:simple_chopper_example/src/home/api/repository/home_repository.dart';
import 'package:simple_chopper_example/src/home/model/item_list_model.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class HomeService extends BaseReactiveService {
  final HomeRepository _repository;

  final itemListValue = ReactiveValue<List<ItemListModel>>([]);

  @factoryMethod
  HomeService.from(this._repository) {
    listenToReactiveValues([
      loadingReactiveValue,
      itemListValue,
    ]);
  }

  Future<dynamic> getItemList() async {
    loadingReactiveValue.value = true;
    return _repository
        .getItemList()
        .then((value) {
          if (value.status == Status.completed) {
            final data = value.data as List<ItemListModel>;
            itemListValue.value = data;
            return data;
          } else {
            throw value.apiException as ApiException;
          }
        })
        .catchError(
          (error) => throw (error),
        )
        .whenComplete(
          () => loadingReactiveValue.value = false,
        );
  }
}
