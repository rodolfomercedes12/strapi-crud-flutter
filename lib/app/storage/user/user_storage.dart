import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:strapi_crud/app/data/models/auth_response.dart';

class UserStorage {
  static final _storage = new FlutterSecureStorage();

  Future setCurrentUser(User user) async {
    return await _storage.write(key: "user", value: jsonEncode(user));
  }

  Future<User> getCurrentUser() async {
    final value = await _storage.read(key: "user");
    final user = new User.fromJson(json.decode(value));
    return user;
  }

  Future setToken(String token) async =>
      await _storage.write(key: "token", value: token);

  Future<String> getToken() async => await _storage.read(key: "token");

  deleteToken() async {
    await _storage.delete(key: "token");
  }
}
