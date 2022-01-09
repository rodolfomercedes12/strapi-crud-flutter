import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      )
    );
  }
}
