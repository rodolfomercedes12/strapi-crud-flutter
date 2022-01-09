import 'package:get/get.dart';
import 'package:strapi_crud/app/data/models/all_products_response.dart';
import 'package:strapi_crud/app/data/repository/products_repository.dart';
import 'package:meta/meta.dart';
import 'package:strapi_crud/app/helpers/custom_alerts.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';

class AllProductController extends GetxController {
  final ProductRepository productRepository;

  AllProductController({@required this.productRepository})
      : assert(productRepository != null);

  RxList<Product> productsList = RxList<Product>([]);
  var loading = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  deleteProduct(int id) async {
    loading(true);
    final productoEliminado = await productRepository.deleteProduct(id);
    loading(false);
    if (productoEliminado) {
      showAlert("PRODUCTO ELIMINADO!", "Se eliminó el producto correctamente",
          onDismiss: () {});
    } else {
      showAlert("Algo salió mal", "Intente nuevamente.", onDismiss: () {
        print("On dismiss");
      });
    }
  }

  getData() async {
    loading(true);
    final products = await productRepository.getAllProducts();
    loading(false);
    this.productsList = products.obs;
    return;
  }
}
