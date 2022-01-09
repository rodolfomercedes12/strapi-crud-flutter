import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/data/models/all_products_response.dart';
import 'package:strapi_crud/app/data/repository/products_repository.dart';
import 'package:strapi_crud/app/helpers/custom_alerts.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';

class AddProductController extends GetxController {
  final ProductRepository productRepository;
  AddProductController({@required this.productRepository})
      : assert(productRepository != null);

  TextEditingController nameProduct = TextEditingController();
  TextEditingController priceProduct = TextEditingController();
  TextEditingController descriptionProduct = TextEditingController();
  var loading = false.obs;

  addProduct(Product product) async {
    loading(true);
    final productoCreado = await productRepository.addProduct(product);
    loading(false);
    if (productoCreado) {
      showAlert("PRODUCTO CREADO!", "Se creó el producto correctamente", onDismiss: () =>  Get.offAllNamed(Routes.ALL_PRODUCTS)   );
      clearController();
      
    } else {
      showAlert("Error!", "Algo salió mal en la petición");
      clearController();
    }
  }

  clearController() {
    nameProduct.clear();
    priceProduct.clear();
    descriptionProduct.clear();
  }
}
