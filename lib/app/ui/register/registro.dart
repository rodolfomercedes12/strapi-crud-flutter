import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/auth/register_controller.dart';
import 'package:strapi_crud/app/helpers/custom_alerts.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerController = Get.find<RegisterController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => registerController.autenticando.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text("Crea una cuenta",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: registerController.userNameController,
                      decoration: InputDecoration(
                          hintText: "Ingrese un nombre de usuario",
                          labelText: "Username",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: registerController.emailController,
                      decoration: InputDecoration(
                          hintText: "Ingrese su email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: true,
                      controller: registerController.passwordController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Ingrese su contraseña",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: registerController.autenticando.value
                                ? null
                                : () async {
                                    FocusScope.of(context).unfocus();
                                    FocusScope.of(context).unfocus();
                                    registerController.register(
                                      registerController.userNameController.text.trim(),
                                      registerController.emailController.text.trim(),
                                      registerController.passwordController.text.trim(),
                                    );

                                   
                                  },
                            child: Text("Registrarse"))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("¿Ya estás registrado?"),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Text("Iniciar Sesión",
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
}
