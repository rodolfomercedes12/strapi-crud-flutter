import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.red, primarySwatch: Colors.red),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}
