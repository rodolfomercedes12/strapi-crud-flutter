import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/data/models/auth_response.dart';
import 'package:strapi_crud/app/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:strapi_crud/app/helpers/custom_alerts.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';
import 'package:strapi_crud/app/storage/user/user_storage.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;
  var autenticando = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userStorage = new UserStorage();

  LoginController({@required this.authRepository}): assert(authRepository != null);

  Future<AuthResponse> login(String email, String password) async {
    this.autenticando.value = true;
    final loginResponse = await authRepository.login(email, password);
    this.autenticando.value = false;
    if (loginResponse.user != null) {
      
      userStorage.setCurrentUser(loginResponse.user);
      userStorage.setToken(loginResponse.jwt);

      Get.offAllNamed(Routes.ALL_PRODUCTS);
    } else {
      //Mostrar Alerta
      showAlert("Login Incorrecto", "Revisa tus credenciales");
    }
  }

  
  logoutUser() {
    userStorage.deleteToken();
    Get.offAllNamed(Routes.LOGIN);
  }



}
