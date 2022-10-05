import 'package:flutter/material.dart';
import 'package:my_balance/app_controller.dart';
import 'package:my_balance/core/core.dart';
import 'package:my_balance/modules/home/components/drawer_list_tile/drawer_list_tile.dart';
import 'package:my_balance/modules/home/controllers/home_controller.dart';
import 'package:my_balance/modules/home/controllers/menu_controller.dart';
import 'package:my_balance/shared/components/app_logo.dart';
import 'package:my_balance/shared/components/image_network_builder.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final appController = AppController.instance(context, listen: true);
    final menuController = MenuController.instance(context, listen: true);
    final sizes = AppSizes(context);

    return Drawer(
      elevation: 2.0,
      child: SafeArea(
        child: SizedBox(
          height: sizes.safeHeight,
          child: Column(
            children: [
              const SizedBox(height: 20),
              if (appController.loggedUser != null) ...[
                Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appController.loggedUser!.avatarUrl != null
                        ? AppColors.fontColor
                        : null,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(500)),
                    child: appController.loggedUser!.avatarUrl == null
                        ? ImageNetworkBuilder(
                            appController.loggedUser!.avatarUrl!,
                            boxFit: BoxFit.cover,
                          )
                        : const AppLogo(size: 30),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  appController.loggedUser!.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyText1(context)?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  appController.loggedUser!.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyText1(context)?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 20),
              ],
              DrawerListTile(
                title: "Carteira",
                icon: const Icon(
                  Icons.wallet,
                ),
                onTap: () {
                  widget.homeController.page = HomePages.wallet;
                  menuController.controlMenu();
                },
              ),
              const Spacer(),
              DrawerListTile(
                title: "Logout",
                icon: const Icon(
                  Icons.power_settings_new_outlined,
                ),
                onTap: () {
                  appController.logout(context);
                },
              ),
              SizedBox(height: sizes.paddingTop - sizes.paddingBottom + 20),
            ],
          ),
        ),
      ),
    );
  }
}
