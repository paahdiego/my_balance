import 'package:flutter/material.dart';
import 'package:my_balance/modules/auth/auth_controller.dart';
import 'package:my_balance/modules/splash/splash_page.dart';
import 'package:my_balance/shared/models/user_model.dart';
import 'package:provider/provider.dart';

class AppController extends ChangeNotifier {
  set loggedUser(UserModel? user) {
    _loggedUser = user;
  }

  // ignore: unnecessary_getters_setters
  UserModel? get loggedUser => _loggedUser;

  clear() {
    loggedUser = null;
  }

  Future<void> logout(BuildContext context) async {
    clear();
    await AuthController.clearUserAndTokenFromStorage().then(
      (value) =>
          Navigator.pushReplacement(context, SplashPage.pageRoute(context)),
    );
  }

  static AppController instance(BuildContext context, {bool listen = false}) =>
      Provider.of<AppController>(context, listen: listen);

  UserModel? _loggedUser;
}
