import 'package:strapi_crud/app/data/models/all_products_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductApiClient {
  Future<List<Product>> getAllProducts() async {
    final resp = await http.get("http://10.0.2.2:1337/api/products",
        headers: {"Content-Type": "application/json"});
    if (resp.statusCode == 200) {
      final produtsResponse = ProductsResponse.fromJson(resp.body);
      return produtsResponse.data;
    } else {
      return [];
    }
  }

  Future<bool> addProduct(Product product) async {
    final newProduct = {
      "data": {
        "name": product.attributes.name,
        "price": product.attributes.price,
        "description": product.attributes.description
      }
    };

    try {
      final resp = await http.post("http://10.0.2.2:1337/api/products",
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(newProduct));
      if (resp.statusCode == 200) {
        print("Registro creado!");
        return true;
      } else {
        print(resp.statusCode);

        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> editProduct(Product product) async {
    final newProduct = {
      "data": {"price":  product.attributes.price, "name": product.attributes.name, "description": product.attributes.description}
    };

    try {
      final resp = await http.put(
          "http://10.0.2.2:1337/api/products/${product.id}",
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(newProduct));
      if (resp.statusCode == 200 || resp.statusCode == 201) {
        print("Producto actualizado!");
        return true;
      } else {
        print(resp.statusCode);

        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  
  Future<bool> deleteProduct( int productId ) async {

    try {
      final resp = await http.delete(
          "http://10.0.2.2:1337/api/products/$productId",
          headers: {"Content-Type": "application/json"},
          
          );
      if (resp.statusCode == 200 || resp.statusCode == 201) {
        print("Producto Eliminado!");
        return true;
      } else {
        print(resp.statusCode);

        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
