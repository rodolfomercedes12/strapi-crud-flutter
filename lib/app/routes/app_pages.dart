import 'package:get/get.dart';
import 'package:strapi_crud/app/bindings/products/add_product_binding.dart';
import 'package:strapi_crud/app/bindings/products/all_products_binding.dart';
import 'package:strapi_crud/app/bindings/auth/login_binding.dart';
import 'package:strapi_crud/app/bindings/auth/register_binding.dart';
import 'package:strapi_crud/app/bindings/products/edit_product_binding.dart';
import 'package:strapi_crud/app/bindings/splash/splash_binding.dart';
import 'package:strapi_crud/app/ui/login/login.dart';
import 'package:strapi_crud/app/ui/products/add_product.dart';
import 'package:strapi_crud/app/ui/products/all_products.dart';
import 'package:strapi_crud/app/ui/products/edit_product_screen.dart';
import 'package:strapi_crud/app/ui/register/registro.dart';
import 'package:strapi_crud/app/ui/splash/splash.dart';
part './app_routes.dart';



class AppPages {
  static final pages = [

      //AUTH
     GetPage(
        name: Routes.SPLASH,
        page: () => SplashScreen(),
        binding: SplashBinding(),
        ),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginScreen(),
        binding: LoginBinding(),
        ),
         GetPage(
        name: Routes.REGISTER,
        page: () => RegisterScreen(),
        binding: RegisterBinding(),
        ),
        //PRODUCTS
        GetPage(
        name: Routes.ALL_PRODUCTS,
        page: () => AllProductScreen(),
        binding: AllProductBinding(),
        ),
       
        GetPage(
        name: Routes.ADD_PRODUCT,
        page: () => AddProductScreen(),
        binding: AddProductBinding(),
        ),
        GetPage(
        name: Routes.EDIT_PRODUCT,
        page: () => EditProductScreen(),
        binding: EditProductBinding(),
        ),
  ];
}
