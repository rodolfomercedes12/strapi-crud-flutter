import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/products/add_product_controller.dart';
import 'package:strapi_crud/app/data/providers/products_api.dart';
import 'package:strapi_crud/app/data/repository/products_repository.dart';

class AddProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(() {
      return AddProductController(productRepository: ProductRepository(productapiClient: ProductApiClient()));
    });
  }
}
