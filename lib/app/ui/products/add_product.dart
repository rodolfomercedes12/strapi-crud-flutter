import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/products/add_product_controller.dart';
import 'package:strapi_crud/app/data/models/all_products_response.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';

class AddProductScreen extends StatelessWidget {
  final addProductController = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx( () => addProductController.loading.value ?  LinearProgressIndicator()  : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.ALL_PRODUCTS);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text("Agregar Producto",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 30,
              ),
              _nameTextField(),
              SizedBox(
                height: 25,
              ),
              _priceTextField(),
              SizedBox(
                height: 25,
              ),
              _descriptionTextField(),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: addProductController.loading.value
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();
                              final newProduct = new Product(
                                  attributes:
                                      Attributes(name:  addProductController.nameProduct.text.trim() ,
                                       price: int.parse(addProductController.priceProduct.text),
                                       description: addProductController.descriptionProduct.text.trim()
                                       
                                       ));

                             final resp = await  addProductController.addProduct(newProduct);
                            },
                      child: Text("Agregar"))),
            ],
          ),
        ),
      ), )
      ),
    );
  }

  TextField _descriptionTextField() {
    return TextField(
              controller: addProductController.descriptionProduct,
              maxLines: 4,
              maxLength: 100,
              decoration: InputDecoration(
                  hintText: "Ingrese una descripción",
                  labelText: "Descripción",
                  prefixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder()),
            );
  }

  TextField _priceTextField() {
    return TextField(
              keyboardType: TextInputType.number,
              controller: addProductController.priceProduct,
              decoration: InputDecoration(
                  hintText: "Precio producto",
                  labelText: "Precio",
                  prefixIcon: Icon(Icons.monetization_on),
                  border: OutlineInputBorder()),
            );
  }

  TextField _nameTextField() {
    return TextField(
              controller: addProductController.nameProduct,
              decoration: InputDecoration(
                  hintText: "Nombre producto",
                  labelText: "Nombre producto",
                  prefixIcon: Icon(Icons.edit_outlined),
                  border: OutlineInputBorder()),
            );
  }
}
