import 'package:strapi_crud/app/data/models/auth_response.dart';
import 'package:strapi_crud/app/data/providers/auth_api.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final AuthApiClient authApiClient;

  AuthRepository({@required this.authApiClient})
      : assert(authApiClient != null);

  Future<AuthResponse>login(String email, String password) async {
    return await  authApiClient.login(email, password);
   
  }

  Future<AuthResponse> register(String username, String email, String password) async {
    return await authApiClient.register(username, email, password);
  }
}
