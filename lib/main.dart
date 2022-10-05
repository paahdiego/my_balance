import 'package:flutter/material.dart';
import 'package:my_balance/app_controller.dart';
import 'package:my_balance/app_widget.dart';
import 'package:my_balance/core/themes/theme_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(
          create: (context) => ThemeController(),
        ),
        ChangeNotifierProvider<AppController>(
          create: (context) => AppController(),
        ),
      ],
      builder: (context, _) {
        return const AppWidget();
      },
    ),
  );
}
