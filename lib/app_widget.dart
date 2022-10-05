import 'package:flutter/material.dart';
import 'package:my_balance/core/themes/app_theme.dart';
import 'package:my_balance/core/themes/theme_controller.dart';
import 'package:my_balance/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.instance(context, listen: true);
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return Consumer<ThemeController>(
          builder: (context, themeController, _) {
            return MaterialApp(
              title: 'My Balance',
              debugShowCheckedModeBanner: false,
              themeMode: themeController.themeMode,
              theme: AppThemes.lightTheme(context),
              darkTheme: AppThemes.darkTheme(context),
              home: const SplashPage(),
            );
          },
        );
      },
    );
  }
}
