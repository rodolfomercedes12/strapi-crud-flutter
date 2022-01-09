import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() {
      return SplashController(
        
      );
    });
  }
}
