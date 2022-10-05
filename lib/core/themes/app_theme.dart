import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_balance/core/core.dart';

class AppThemes {
  static ThemeData defaultTheme(BuildContext context) =>
      ThemeData.light().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.primary),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: AppSizes.defaultBorderRadius,
            ),
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: AppColors.secondary,
          scrimColor: AppColors.fontColor.withOpacity(0.5),
          elevation: 2.0,
        ),
        listTileTheme: ListTileTheme.of(context).copyWith(
          iconColor: AppColors.primary,
        ),
        iconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        primaryIconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primary,
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: AppColors.primary,
        ),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: AppColors.fontColor,
                displayColor: AppColors.fontColor,
              ),
        ),
      );
}
