import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';

class Styels {
  static var styel18;

  static var styel25;

  static var styel22;

  static var styel24;

  static var styel12038;

  static ThemeData themeData(
      {required bool isDarkTheem, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheem ? AppColors.darkScaffold : AppColors.lightScaffold,
      cardColor: isDarkTheem
          ? const Color.fromARGB(177, 0, 0, 0)
          : AppColors.lightScaffold,
      // خاص ب text app
      brightness: isDarkTheem ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: isDarkTheem ? Colors.white : Colors.black,
        ),
        centerTitle: false,
        elevation: 0,
        titleTextStyle:
            TextStyle(color: isDarkTheem ? Colors.white : Colors.black),
        color: isDarkTheem ? AppColors.darkScaffold : AppColors.lightScaffold,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkTheem ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
