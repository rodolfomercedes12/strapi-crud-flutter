import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlert(String titulo, String descripcion, {Function onDismiss}) {
  Get.snackbar(titulo, descripcion, snackPosition: SnackPosition.BOTTOM,
      snackbarStatus: (status) {
    if (status == SnackbarStatus.CLOSED) {
      onDismiss();
    }
  });
}

showCustomDialog(String title, String description, {Function press}) {
  Get.dialog(AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
    content: Text(description),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                if (press != null) {
                  press();
                }
              },
              child: Text("Aceptar")),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Cancelar")),
        ],
      )
    ],
  ));
}
