import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';

class Styels {
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
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: isDarkTheem ? Colors.white70 : AppColors.darkScaffold,
        ),
        fillColor: isDarkTheem ? Colors.grey[800] : Colors.grey[200],
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
