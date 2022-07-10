import 'package:flutter/material.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool currentTheme = false;
  ThemeMode get themeMode {
    if (currentTheme == false) {
      return ThemeMode.light;
    } else if (currentTheme == true) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  void toggleTheme(bool isOn) async {
    final SharedPreferences theme = await SharedPreferences.getInstance();
    await theme.setBool('theme', isOn);
    currentTheme = isOn;
    notifyListeners();
  }

  initiallize() async {
    final SharedPreferences theme = await SharedPreferences.getInstance();
    currentTheme = theme.getBool('theme') ?? false;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.mainBlackColor,
    primaryColor: AppColors.mainBlackColor,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white70),
    indicatorColor: Colors.white12,
    focusColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainBlackColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey.shade700, // This is a custom color variable
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    ),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.appBarColor,
    focusColor: Colors.black,
    primaryColor: AppColors.backgroundColor,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.black54),
    indicatorColor: Colors.black12,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.appBarColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blueAccent, // This is a custom color variable
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      subtitle1: TextStyle(color: Colors.black),
    ),
  );
}
