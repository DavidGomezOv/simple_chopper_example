import 'package:simple_chopper_example/src/core/converters/exception/api_exception.dart';
import 'package:simple_chopper_example/src/core/utils/app_dialogs.dart';
import 'package:stacked/stacked.dart';

abstract class AppBaseViewModel extends ReactiveViewModel {
  Future<void> errorApiResponse(dynamic exception, {Function? click}) async {
    if (exception is! ApiException) {
      showAlertDialog(
        'Error server',
        okClick: click,
      );
    } else {
      if (exception is ApiErrorUnProcessableEntity) {
        showAlertDialog(
          exception.error!,
          okClick: click,
        );
      } else if (exception is ApiErrorResponse) {
        showAlertDialog(
          exception.error!,
          okClick: click,
        );
      }
    }
  }
}
