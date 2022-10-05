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
    return FlutterLogo(size: size ?? sizes.displayWidth * 0.35);
  }
}
