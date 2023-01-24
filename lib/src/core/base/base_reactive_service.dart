import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class BaseReactiveService with ReactiveServiceMixin {
  final ReactiveValue<bool> loadingReactiveValue = ReactiveValue(false);

  @mustCallSuper
  BaseReactiveService() {
    listenToReactiveValues([
      loadingReactiveValue,
    ]);
  }
}
