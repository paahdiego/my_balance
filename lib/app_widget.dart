import 'package:flutter/material.dart';
import 'package:my_balance/core/themes/app_theme.dart';
import 'package:my_balance/modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Balance',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.defaultTheme(context),
      home: const SplashPage(),
    );
  }
}
