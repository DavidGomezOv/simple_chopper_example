import 'package:simple_chopper_example/src/core/converters/exception/api_exception.dart';

class ApiResult<T> {
  Status status;
  T? data;
  ApiException? apiException;

  ApiResult.complete(this.data) : status = Status.completed;

  ApiResult.processing(this.data) : status = Status.processing;

  ApiResult.error(this.apiException) : status = Status.error;
}

enum Status { completed, processing, error }
