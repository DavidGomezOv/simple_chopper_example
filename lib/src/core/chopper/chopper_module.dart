import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_chopper_example/src/core/converters/request_json_converter.dart';
import 'package:simple_chopper_example/src/core/converters/request_json_error_converter.dart';
import 'package:simple_chopper_example/src/home/api/datasource/home_datasource.dart';
import 'package:simple_chopper_example/src/home/model/item_list_model.dart';

@module
abstract class ChopperModule {
  String get baseUrl => 'https://63c99b74c3e2021b2d5b0698.mockapi.io';

  @lazySingleton
  ChopperClient chopperBuilder() => ChopperClient(
        baseUrl: Uri.tryParse(baseUrl),
        converter: RequestJsonConverter({
          ItemListModel: (jsonData) => ItemListModel.fromJson(jsonData),
        }),
        errorConverter: RequestJsonErrorConverter(),
        services: [
          HomeDatasource.create(),
        ],
      );
}
