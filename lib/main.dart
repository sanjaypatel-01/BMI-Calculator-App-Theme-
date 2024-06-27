import 'package:bmi_calculator_theme/Config/Theme.dart';
import 'package:bmi_calculator_theme/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:bmi_calculator_theme/Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}



