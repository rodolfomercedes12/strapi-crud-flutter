import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/products/edit_product_controller.dart';
import 'package:strapi_crud/app/data/models/all_products_response.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';

class EditProductScreen extends StatefulWidget {
  EditProductScreen({this.product});

  Product product;

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final editProductController = Get.find<EditProductController>();

  @override
  void initState() {
    final Product product = Get.arguments;
    widget.product = product;
    editProductController.nameProduct.text = product.attributes.name;
    editProductController.priceProduct.text = product.attributes.price.toString();
    editProductController.descriptionProduct.text = product.attributes.description;
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => editProductController.loading.value
            ? LinearProgressIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
                        child: Text("Editar Producto",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold)),
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
                              onPressed: editProductController.loading.value
                                  ? null
                                  : () async {
                                      FocusScope.of(context).unfocus();
                                      final newProduct = new Product(
                                          id: widget.product.id,
                                          attributes: Attributes(
                                              name: editProductController.nameProduct.text.trim(),
                                              price:
                                                  int.parse(editProductController.priceProduct.text),
                                              description: editProductController.descriptionProduct
                                                  .text
                                                  .trim()));

                                      final resp = await editProductController
                                          .editProduct(newProduct);
                                    },
                              child: Text("Editar"))),
                    ],
                  ),
                ),
              ),
      )),
    );
  }

  TextField _descriptionTextField() {
    return TextField(
                      controller: editProductController.descriptionProduct,
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
                      controller: editProductController.priceProduct,
                      decoration: InputDecoration(
                          hintText: "Precio producto",
                          labelText: "Precio",
                          prefixIcon: Icon(Icons.monetization_on),
                          border: OutlineInputBorder()),
                    );
  }

  TextField _nameTextField() {
    return TextField(
                      controller: editProductController.nameProduct,
                      decoration: InputDecoration(
                          hintText: "Nombre producto",
                          labelText: "Nombre producto",
                          prefixIcon: Icon(Icons.edit_outlined),
                          border: OutlineInputBorder()),
                    );
  }
}
