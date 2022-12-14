import 'package:flutter/material.dart';
import 'package:my_balance/modules/auth/auth_controller.dart';
import 'package:my_balance/modules/splash/splash_page.dart';
import 'package:my_balance/shared/models/user_model.dart';

class LoginController {
  final pageStateNotifier = ValueNotifier<PageState>(PageState.notLoading);

  set pageState(PageState state) => pageStateNotifier.value = state;
  PageState get pageState => pageStateNotifier.value;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // final authService = AuthService();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      pageState = PageState.loading;

      await Future.delayed(const Duration(seconds: 4));

      final mockedUser = UserModel(
        id: "123",
        email: 'user@mocked.com',
        name: "Usuário mockado",
        avatarUrl:
            "https://todosnegrosdomundo.com.br/wp-content/uploads/2020/05/denzel-696x388.jpeg",
      );

      await AuthController.authenticate(user: mockedUser);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, SplashPage.pageRoute(context));

      pageState = PageState.notLoading;
    }
  }
}

enum PageState {
  loading,
  notLoading,
}
