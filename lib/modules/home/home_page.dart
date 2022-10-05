import 'package:flutter/material.dart';

import 'package:my_balance/modules/home/components/home_page_body/home_page_body.dart';
import 'package:my_balance/modules/home/controllers/menu_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static MaterialPageRoute pageRoute(BuildContext context) =>
      MaterialPageRoute(builder: (context) => const HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuController>(
          create: (context) => MenuController(),
        ),
      ],
      builder: (context, _) {
        return Consumer<MenuController>(
          builder: (context, menuController, _) {
            return HomePageBody(menuController: menuController);
          },
        );
      },
    );
  }
}
