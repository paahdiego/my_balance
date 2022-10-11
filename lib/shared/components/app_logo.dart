import 'package:flutter/material.dart';
import 'package:my_balance/core/core.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.size,
  }) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Image.asset(
      height: size ?? sizes.displayHeight * 0.25,
      AppImages.logov3,
      fit: BoxFit.contain,
    );
  }
}
