import 'package:flutter/material.dart';
import 'package:my_balance/core/core.dart';
import 'package:my_balance/modules/login/components/login_body.dart';
import 'package:my_balance/shared/components/app_gradient_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static MaterialPageRoute pageRoute(BuildContext context) =>
      MaterialPageRoute(builder: (context) => const LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AppGradientContainer(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: LoginBody(),
        ),
      ),
    );
  }
}
