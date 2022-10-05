import 'package:flutter/material.dart';

import 'package:my_balance/core/core.dart';
import 'package:my_balance/core/themes/theme_controller.dart';

class AppGradientContainer extends StatelessWidget {
  const AppGradientContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.instance(context);
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: AppColors.backgroundGradient(context),
          ),
          child: child,
        );
      },
    );
  }
}
