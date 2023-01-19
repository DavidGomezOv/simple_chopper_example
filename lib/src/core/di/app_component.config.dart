// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:simple_chopper_example/src/core/chopper/chopper_module.dart'
    as _i7;
import 'package:simple_chopper_example/src/home/api/datasource/home_datasource.dart'
    as _i5;
import 'package:simple_chopper_example/src/home/api/repository/home_repository.dart'
    as _i4;
import 'package:simple_chopper_example/src/home/services/home_service.dart'
    as _i6;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt $appInitGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final chopperModule = _$ChopperModule();
    gh.lazySingleton<_i3.ChopperClient>(() => chopperModule.chopperBuilder());
    gh.factory<_i4.HomeRepository>(
        () => _i4.HomeRepository.from(gh<_i5.HomeDatasource>()));
    gh.lazySingleton<_i6.HomeService>(
        () => _i6.HomeService.from(gh<_i4.HomeRepository>()));
    gh.factory<String>(() => chopperModule.baseUrl);
    return this;
  }
}

class _$ChopperModule extends _i7.ChopperModule {}
