import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/auth/login_controller.dart';
import 'package:strapi_crud/app/helpers/custom_alerts.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => loginController.autenticando.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                     Icon(Icons.shopping_cart_outlined, color: Colors.red, size: 50),
            SizedBox(
              height: 15,
            ),
            Text("ProductsApp",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
                    SizedBox(
                      height: 40,
                    ),
                    _emailTextField(),
                    SizedBox(
                      height: 30,
                    ),
                    _passwordTextField(),
                    SizedBox(
                      height: 40,
                    ),
                    _btnLogin(context),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("¿Aun no tienes una cuenta?"),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.REGISTER);
                          },
                          child: Text("Regístrate",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    ));
  }

  SizedBox _btnLogin(BuildContext context) {
    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: loginController.autenticando.value
                              ? null
                              : () async {
                                  FocusScope.of(context).unfocus();
                                  if (!GetUtils.isEmail(loginController
                                      .emailController.text
                                      .trim())) {
                                        showAlert("Login no válido",
                                        "Este email no es válido");
                                  } else if (loginController
                                      .emailController.text
                                      .trim()
                                      .isEmpty) {
                                    showAlert("Login no válido",
                                        "Proporciona un email");
                                  } else {
                                    loginController.login(
                                        loginController.emailController.text
                                            .trim(),
                                        loginController
                                            .passwordController.text
                                            .trim());
                                  }
                                },
                          child: Text("Login")));
  }

  TextField _passwordTextField() {
    return TextField(
                    obscureText: true,
                    controller: loginController.passwordController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Ingrese su contraseña",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder()),
                  );
  }

  TextField _emailTextField() {
    return TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: loginController.emailController,
                    decoration: InputDecoration(
                        hintText: "Ingrese su email",
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                  );
  }
}
