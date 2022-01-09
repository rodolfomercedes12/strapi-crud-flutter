import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/data/models/all_products_response.dart';
import 'package:strapi_crud/app/data/repository/products_repository.dart';
import 'package:strapi_crud/app/helpers/custom_alerts.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';

class EditProductController extends GetxController {
  final ProductRepository productRepository;
  EditProductController({@required this.productRepository})
      : assert(productRepository != null);
  Product product;
  TextEditingController nameProduct;
  TextEditingController priceProduct;
  TextEditingController descriptionProduct;
  var loading = false.obs;

  @override
  void onInit() {
    nameProduct = TextEditingController();
    priceProduct = TextEditingController();
    descriptionProduct = TextEditingController();
    super.onInit();
  }

  editProduct(Product product) async {
    loading(true);
    final productoActualizado = await productRepository.updateProduct(product);
    loading(false);
    if (productoActualizado) {
      showAlert(
          "PRODUCTO ACTUALIZADO!", "Se actualizó el producto correctamente",
          onDismiss: () => Get.offAllNamed(Routes.ALL_PRODUCTS));
    } else {
      showAlert("Error!", "Algo salió mal en la petición");
    }
  }

  clearController() {
    nameProduct.clear();
    priceProduct.clear();
    descriptionProduct.clear();
  }
}
