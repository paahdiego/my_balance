import 'package:flutter/material.dart';
import 'package:my_balance/core/core.dart';
import 'package:my_balance/modules/auth/auth_controller.dart';
import 'package:my_balance/shared/components/app_gradient_container.dart';
import 'package:my_balance/shared/components/app_loading_icon.dart';
import 'package:my_balance/shared/components/app_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static MaterialPageRoute pageRoute(BuildContext context) =>
      MaterialPageRoute(builder: (context) => const SplashPage());

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => AuthController.isAuthenticated(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return AppGradientContainer(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: SizedBox(
            width: sizes.displayWidth,
            height: sizes.safeHeight,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: const [
                  AppLogo(),
                  SizedBox(height: 40),
                  Center(child: AppLoadingIcon()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
