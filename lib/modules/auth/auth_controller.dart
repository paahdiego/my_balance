// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_balance/app_controller.dart';
import 'package:my_balance/modules/home/home_page.dart';
import 'package:my_balance/modules/login/login_page.dart';
import 'package:my_balance/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static Future isAuthenticated(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    if (instance.containsKey('loggedUser')) {
      final loggedUser = await getUser();
      AppController.instance(context).loggedUser = loggedUser;

      Navigator.pushReplacement(context, HomePage.pageRoute(context));
    } else {
      Navigator.pushReplacement(context, LoginPage.pageRoute(context));
    }
  }

  static Future<void> authenticate({
    required UserModel user,
  }) async {
    await saveUser(user);
  }

  static Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("loggedUser", user.toJson());
  }

  static Future<UserModel?> getUser() async {
    final instance = await SharedPreferences.getInstance();
    final String? userJson = instance.getString("loggedUser");

    if (userJson != null) {
      return UserModel.fromJson(userJson);
    }
    return null;
  }

  static Future<void> clearUserAndTokenFromStorage() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove("loggedUser");
  }
}
