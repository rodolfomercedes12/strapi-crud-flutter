import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/auth/login_controller.dart';
import 'package:strapi_crud/app/data/providers/auth_api.dart';
import 'package:strapi_crud/app/data/repository/auth_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(
          authRepository: AuthRepository(authApiClient: AuthApiClient()));
    });

    //Get.put(AuthController());
  }
}
