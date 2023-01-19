import 'package:injectable/injectable.dart';
import 'package:simple_chopper_example/src/core/converters/exception/api_exception.dart';
import 'package:simple_chopper_example/src/core/either/api_result.dart';
import 'package:simple_chopper_example/src/home/api/datasource/home_datasource.dart';

@injectable
class HomeRepository {
  final HomeDatasource _datasource;

  @factoryMethod
  HomeRepository.from(this._datasource);

  Future<ApiResult<dynamic>> getItemList() {
    return _datasource.getItemList().then((value) {
      if (value.error is ApiException) {
        return ApiResult.error(value.error as ApiException);
      }
      return ApiResult.complete(value.body);
    });
  }
}
