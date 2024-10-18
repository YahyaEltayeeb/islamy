import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/Splash.dart';
import 'package:flutter_application_1/common/App_theme.dart';
import 'package:flutter_application_1/common/ThemeManger.dart';
import 'package:flutter_application_1/screens/hadeeth_screen.dart';
import 'package:flutter_application_1/screens/quran_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode appThemeMode = ThemeMode.light;
    return MaterialApp(
        locale: Locale(Provider.of<ThemeProvider>(context).localeCode),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: Provider.of<ThemeProvider>(context).appThemeMode,
        routes: {
          SplachScreenn.routName: (_) => SplachScreenn(),
          HomeScreen.routName: (_) => HomeScreen(),
          QuranScreen.routName: (_) => QuranScreen(),
          HadeethScreen.routName: (_) => HadeethScreen()
        });
  }
}
