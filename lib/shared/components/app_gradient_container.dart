import 'package:flutter/material.dart';

import 'package:my_balance/core/core.dart';

class AppGradientContainer extends StatelessWidget {
  const AppGradientContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [0.8, 1.0],
          colors: [
            AppColors.backgroundColor,
            AppColors.subBackgroundColor,
          ],
          tileMode: TileMode.mirror,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
