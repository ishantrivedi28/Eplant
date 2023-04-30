import 'package:eplant/controllers/add_to_cart_controller.dart';
import 'package:eplant/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  Get.put(AddToCartController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Plant',
      home: MainScreen(),
    );
  }
}
