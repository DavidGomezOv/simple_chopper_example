import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_chopper_example/src/home/api/datasource/home_datasource.dart';

@module
abstract class ProviderApiModule {
  HomeDatasource provideHomeDataSource(ChopperClient client) =>
      client.getService<HomeDatasource>();
}
