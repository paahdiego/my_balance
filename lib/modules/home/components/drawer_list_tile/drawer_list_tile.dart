import 'package:flutter/material.dart';
import 'package:my_balance/core/core.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.selected = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        highlightColor: AppColors.primary.withAlpha(120),
        overlayColor: MaterialStateProperty.all(AppColors.primary),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary.withAlpha(120) : null,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              Icon(icon, color: selected ? AppColors.white : AppColors.primary),
              const SizedBox(width: 10),
              Text(
                title,
                style: AppTextStyles.bodyText1(context)?.copyWith(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
