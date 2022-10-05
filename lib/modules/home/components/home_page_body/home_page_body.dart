import 'package:flutter/material.dart';

import 'package:my_balance/core/core.dart';
import 'package:my_balance/modules/home/components/side_menu/side_menu.dart';
import 'package:my_balance/modules/home/controllers/home_controller.dart';
import 'package:my_balance/modules/home/controllers/menu_controller.dart';
import 'package:my_balance/shared/components/app_default_button.dart';
import 'package:my_balance/shared/components/app_gradient_container.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    Key? key,
    required this.menuController,
  }) : super(key: key);

  final MenuController menuController;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return AppGradientContainer(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          key: widget.menuController.scaffoldKey,
          drawer: SideMenu(homeController: homeController),
          body: ValueListenableBuilder<HomePages>(
            valueListenable: homeController.pageNotifier,
            builder: (context, currentPage, _) {
              switch (currentPage) {
                default:
                  return SafeArea(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                widget.menuController.controlMenu();
                              },
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                "Dashboard",
                                style:
                                    AppTextStyles.bodyText1(context)?.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(50),
                          decoration: BoxDecoration(
                            color: AppColors.subBackgroundColor(context),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'carteira',
                                style:
                                    AppTextStyles.bodyText1(context)?.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AppDefaultButton(
                                onPressed: () {},
                                child: Text(
                                  "Botão",
                                  style: AppTextStyles.bodyText1(context)
                                      ?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AppDefaultButton(
                                onPressed: () {},
                                backgroundColor: AppColors.secondary,
                                child: Text(
                                  "Botão",
                                  style: AppTextStyles.bodyText1(context)
                                      ?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AppDefaultButton(
                                onPressed: () {},
                                backgroundColor: AppColors.error,
                                child: Text(
                                  "Botão",
                                  style: AppTextStyles.bodyText1(context)
                                      ?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
