import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/App_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      dividerTheme: DividerThemeData(color: AppColors.mainLightcolor),
      iconTheme: IconThemeData(color: AppColors.mainLightcolor),
      dividerColor: AppColors.mainLightcolor,
      colorScheme: ColorScheme(
          background: Colors.white,
          onBackground: Colors.white,
          brightness: Brightness.light,
          primary: AppColors.mainLightcolor,
          onPrimary: AppColors.mainLightcolor,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.black,
          onSurface: Colors.white),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColors.mainLightcolor),
      primaryColor: AppColors.mainLightcolor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0),
          backgroundColor: Colors.transparent,
          elevation: 0));
  static ThemeData darkTheme = ThemeData(
    iconTheme: IconThemeData(color: AppColors.goldcolor),
    dividerTheme: DividerThemeData(color: AppColors.goldcolor),
    brightness: Brightness.dark,
    dividerColor: AppColors.goldcolor,
    colorScheme: ColorScheme(
        background: AppColors.maindarkcolor,
        onBackground: Colors.white,
        brightness: Brightness.dark,
        primary: AppColors.maindarkcolor,
        onPrimary: AppColors.maindarkcolor,
        secondary: Colors.white,
        onSecondary: AppColors.goldcolor,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.white),
    textTheme: TextTheme(
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white)),
    primaryColor: AppColors.maindarkcolor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30.0)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.goldcolor,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.maindarkcolor),
  );
}
