import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier {
   changThemeMode(ThemeMode themeMode) {
    appThemeMode = themeMode;
    notifyListeners();
  }
  void changAppLocale(String local) {
    localeCode = local;
    notifyListeners();
  }
   bool get isDark=>appThemeMode==ThemeMode.dark;
   ThemeMode appThemeMode = ThemeMode.dark;
   String localeCode='en';
}
