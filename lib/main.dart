import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/core/di/di.dart';
import 'package:simple_calculator/presentation/views/calculator_view.dart';

void main() {
  // Initialize dependency injection
  setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorView(),
    );
  }
}
