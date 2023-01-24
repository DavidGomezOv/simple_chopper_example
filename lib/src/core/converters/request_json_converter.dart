import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:simple_chopper_example/src/core/extensions/string_extensions.dart';

class RequestJsonConverter implements Converter {
  final Map<Type, Function>? typeToJsonFactoryMap;

  RequestJsonConverter(this.typeToJsonFactoryMap);

  @override
  FutureOr<Request> convertRequest(Request request) {
    if (request.multipart) return request;
    final req =
        applyHeader(request, contentTypeKey, jsonHeaders, override: false);
    return _encodeJson(req);
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
      Response response) {
    return response.copyWith(
      body: fromJsonData<BodyType, InnerType>(
          response.body, typeToJsonFactoryMap?[InnerType]),
    );
  }

  T? fromJsonData<T, InnerType>(String jsonData, Function? jsonParser) {
    if (jsonData.isJson()) {
      var jsonMap = json.decode(jsonData);
      if (jsonMap is List) {
        return jsonMap.map((item) {
          if (jsonParser != null) {
            return jsonParser(item as Map<String, dynamic>) as InnerType;
          } else {
            return (item as Map<String, dynamic>) as InnerType;
          }
        }).toList() as T;
      }
      if (jsonParser != null) {
        return jsonParser(jsonMap);
      }
    }
    return null;
  }

  Request _encodeJson(Request request) {
    var contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  dynamic encodeDateTime(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return item;
  }
}
