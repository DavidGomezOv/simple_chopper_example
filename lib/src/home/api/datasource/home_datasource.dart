import 'package:chopper/chopper.dart';
import 'package:simple_chopper_example/src/home/model/item_list_model.dart';

part 'home_datasource.chopper.dart';

@ChopperApi()
abstract class HomeDatasource extends ChopperService {
  @Get(path: '/item_list')
  Future<Response<List<ItemListModel>>> getItemList();

  static _$HomeDatasource create([ChopperClient? client]) =>
      _$HomeDatasource(client);
}
