import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:strapi_crud/app/controllers/auth/login_controller.dart';
import 'package:strapi_crud/app/controllers/products/all_products_controller.dart';
import 'package:strapi_crud/app/data/providers/auth_api.dart';
import 'package:strapi_crud/app/data/repository/auth_repository.dart';
import 'package:strapi_crud/app/helpers/custom_alerts.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';
import 'package:strapi_crud/app/ui/widgets/drawer_widget.dart';

class AllProductScreen extends StatelessWidget {
  final allProductsController = Get.find<AllProductController>();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products App"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  final loginController = Get.put(LoginController(authRepository: AuthRepository(authApiClient: AuthApiClient())));
                  loginController.logoutUser();
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        drawer: DrawerWidget(),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: WaterDropHeader(
            complete: Icon(
              Icons.check,
            ),
            waterDropColor: Colors.red,
          ),
          onRefresh: () {
            cargarProductos();
          },
          child: Obx(() => allProductsController.loading.value
              ? Center(child: CircularProgressIndicator())
              : Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text("Productos Disponibles",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        _listadoProductos(),
                      ],
                    ),
                  ),
                )),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.offAllNamed(Routes.ADD_PRODUCT);
          },
        ),
      ),
    );
  }

  cargarProductos() async {
    final resp = await allProductsController.getData();
    _refreshController.refreshCompleted();
  }

  Expanded _listadoProductos() {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: allProductsController.productsList.length,
        itemBuilder: (BuildContext context, int index) {
          final product = allProductsController.productsList[index];

          return ListTile(
            onTap: () {
              Get.offAllNamed(Routes.EDIT_PRODUCT, arguments: product);
            },
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            ),
            title: Text(product.attributes.name),
            subtitle: Text(product.attributes.description),
            trailing: IconButton(
                onPressed: () {
                  showCustomDialog("¿Deseas eliminar este registro?",
                      "Se eliminará permanentemente", press: () {
                    Get.back();
                    allProductsController.deleteProduct(product.id);
                  });
                },
                icon: Icon(Icons.delete, color: Colors.red)),
          );
        },
      ),
    );
  }
}
