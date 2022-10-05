import 'package:flutter/material.dart';

class HomeController {
  final pageNotifier = ValueNotifier<HomePages>(HomePages.wallet);

  HomePages get page => pageNotifier.value;

  set page(HomePages page) => pageNotifier.value = page;
}

enum HomePages { wallet }
