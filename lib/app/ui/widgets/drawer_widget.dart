import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapi_crud/app/data/models/auth_response.dart';
import 'package:strapi_crud/app/routes/app_pages.dart';
import 'package:strapi_crud/app/storage/user/user_storage.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  User user;

  @override
  void initState() {
    initUser();
    super.initState();
  }

  initUser() async {
    final userStorage = new UserStorage();
    final currentUser = await userStorage.getCurrentUser();
    setState(() {
      user = currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(user.username ?? ""),
          accountEmail: Text(user.email ?? ""),
          currentAccountPicture: CircleAvatar(
            child: Text(user.username[0].toUpperCase()),
          ),
        ),
      ],
    ));
  }
}
