import 'package:chopper/chopper.dart';
import 'package:simple_chopper_example/src/core/extensions/string_extensions.dart';

class ApiException<T> {
  static ApiException<dynamic> error(Response<dynamic> response) {
    ApiException apiResponse = ApiErrorResponse('Error server');
    if (!response.isSuccessful) {
      String message;
      if (response.error != null) {
        message = response.error.toString();
      } else {
        message = response.body.toString();
      }

      if (message.isNotEmpty) {
        if (message.isJson()) {
          try {
            var json = message.toJson();
            switch (response.statusCode) {
              case 422:
                apiResponse =
                    ApiErrorUnProcessableEntity(json['mssg'].toString());
                break;
              case 401:
                apiResponse =
                    UnAuthorizedAccessException(json['mssg'].toString());
                break;
              case 403:
                apiResponse = ApiErrorSession(json['mssg'].toString());
                break;
              default:
                apiResponse = ApiErrorResponse('Error server');
                break;
            }
          } catch (e) {
            apiResponse = ApiErrorResponse('Error server');
          }
        }
      }
    }
    return apiResponse;
  }
}

class ApiErrorResponse<T> extends ApiException<T> {
  final String? error;

  ApiErrorResponse([this.error]);
}

class ApiErrorUnProcessableEntity<T> extends ApiException<T> {
  final String? error;

  ApiErrorUnProcessableEntity([this.error]);
}

class UnAuthorizedAccessException<T> extends ApiException<T> {
  final String? error;

  UnAuthorizedAccessException([this.error]);
}

class ApiErrorSeveralSessions<T> extends ApiException<T> {
  final String? error;

  ApiErrorSeveralSessions([this.error]);
}

class ApiErrorSession<T> extends ApiException<T> {
  final String? error;

  ApiErrorSession([this.error]);
}

class ApiErrorUnregister<T> extends ApiException<T> {
  final String? error;

  ApiErrorUnregister([this.error]);
}

class ApiErrorEmailInUse<T> extends ApiException<T> {
  final String? error;

  ApiErrorEmailInUse([this.error]);
}
