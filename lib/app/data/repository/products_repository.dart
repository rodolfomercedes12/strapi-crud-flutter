import 'package:strapi_crud/app/data/models/all_products_response.dart';
import 'package:strapi_crud/app/data/providers/products_api.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final ProductApiClient productapiClient;
  ProductRepository({@required this.productapiClient})
      : assert(productapiClient != null);

  //obtener todos los productos

  Future<List<Product>> getAllProducts() async {
    return await productapiClient.getAllProducts();
  }

  //agregar
  Future<bool> addProduct(Product product) async {
    return await productapiClient.addProduct(product);
  }

  //actualizar

  Future<bool> updateProduct(Product product) async {
    return await productapiClient.editProduct(product);
  }

  //eliminar
  Future<bool> deleteProduct( int id ) async {
    return await productapiClient.deleteProduct(id);
  }
}
