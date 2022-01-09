import 'package:get/get.dart';
import 'package:strapi_crud/app/controllers/products/all_products_controller.dart';
import 'package:strapi_crud/app/data/providers/products_api.dart';
import 'package:strapi_crud/app/data/repository/products_repository.dart';

class AllProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProductController>(() {
      return AllProductController(productRepository: ProductRepository(productapiClient: ProductApiClient()));
    });
  }
}
