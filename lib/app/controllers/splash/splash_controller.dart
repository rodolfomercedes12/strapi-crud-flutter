import 'package:get/get.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';
import 'package:strapi_crud/app/storage/user/user_storage.dart';

class SplashController extends GetxController {
  String token = "";
  final userStorage = UserStorage();
  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  checkLoginStatus() async {
    token = await userStorage.getToken();
    if (token == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.ALL_PRODUCTS);
    }
  }


}
