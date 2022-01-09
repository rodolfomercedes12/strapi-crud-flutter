

import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/products/edit_product_controller.dart';
import 'package:strapi_crud/app/data/providers/products_api.dart';
import 'package:strapi_crud/app/data/repository/products_repository.dart';

class EditProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProductController>(() {
      return EditProductController(productRepository: ProductRepository(productapiClient: ProductApiClient()));
    });
  }
}