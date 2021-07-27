import 'package:covid_statistics/src/app.dart';
import 'package:covid_statistics/src/controller/covid_statistics_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(CovidStatisticsController());
      }),
      home: App(),
    );
  }
}
