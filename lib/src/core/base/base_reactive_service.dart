import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class BaseReactiveService with ListenableServiceMixin {
  final ReactiveValue<bool> loadingReactiveValue = ReactiveValue(false);

  @mustCallSuper
  BaseReactiveService() {
    listenToReactiveValues([
      loadingReactiveValue,
    ]);
  }
}
