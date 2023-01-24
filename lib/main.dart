import 'package:flutter/material.dart';
import 'package:simple_chopper_example/routes.dart';
import 'package:simple_chopper_example/src/core/di/app_component.dart';

void main() async {
  configureGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chopper App Demo',
      initialRoute: Routes.home,
      routes: Routes.routes,
    );
  }
}
