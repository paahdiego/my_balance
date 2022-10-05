import 'package:flutter/material.dart';
import 'package:my_balance/app_controller.dart';
import 'package:my_balance/app_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
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
