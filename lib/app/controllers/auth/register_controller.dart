import 'package:get/get.dart';
import 'package:strapi_crud/app/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:strapi_crud/app/helpers/custom_alerts.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';
import 'package:strapi_crud/app/storage/user/user_storage.dart';

class RegisterController extends GetxController {
  final AuthRepository authRepository;
  var autenticando = false.obs;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterController({@required this.authRepository})
      : assert(authRepository != null);

  Future register(String username, String email, String password) async {
    this.autenticando.value = true;
    final registerResponse =
        await authRepository.register(username, email, password);
    this.autenticando.value = false;
    if (registerResponse.user != null) {
      final userStorage = new UserStorage();
      userStorage.setCurrentUser(registerResponse.user);
      userStorage.setToken(registerResponse.jwt);

      Get.offAllNamed(Routes.ALL_PRODUCTS);
    } else {
      //Mostrar Alerta
      showAlert("Registro Incorrecto",  registerResponse.msg );
    }
  }
}
