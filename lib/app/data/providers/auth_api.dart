import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:strapi_crud/app/data/models/auth_response.dart';

class AuthApiClient {
  final _storage = new FlutterSecureStorage();

  Future<AuthResponse> login(String email, String password) async {
    final data = {"identifier": email, "password": password};
    final http.Response response = await http.post(
        "http://10.0.2.2:1337/api/auth/local",
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final loginResponse = AuthResponse.fromJson(response.body);

      return loginResponse;
    } else {
      return AuthResponse( user:  null, jwt: null,);
    }
  }

  //REGISTRO

  Future<AuthResponse> register(
    String username,
    String email,
    String password,
  ) async {
    final data = {"email": email, "password": password, "username": username};
    final http.Response response = await http.post(
        "http://10.0.2.2:1337/api/auth/local/register",
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final registerResponse = AuthResponse.fromJson(response.body);
      _guardarToken(registerResponse.jwt);
      return registerResponse;
    } else {
      final respBody = jsonDecode(response.body);
      final msg = respBody["error"]["message"];
      return AuthResponse( user:  null, jwt: null, msg: msg );
      
    }
  }

  _guardarToken(String token) async {
    return await _storage.write(key: "token", value: token);
  }

  _guardarUsuario(User user) async {
    _storage.write(key: "user", value: json.encode(user));
  }

  Future logout() async {
    await _storage.delete(key: "token");
  }
}
