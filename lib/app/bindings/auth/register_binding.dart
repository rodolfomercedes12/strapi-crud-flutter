import 'package:get/get.dart';


import 'package:strapi_crud/app/controllers/auth/register_controller.dart';
import 'package:strapi_crud/app/data/providers/auth_api.dart';
import 'package:strapi_crud/app/data/repository/auth_repository.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() {
      return RegisterController(
          authRepository: AuthRepository(authApiClient: AuthApiClient()));
    });
    //Get.put(AuthController());
  }
}
