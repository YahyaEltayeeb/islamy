import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_images.dart';
import 'package:flutter_application_1/tabs/hadeeth_tab.dart';
import 'package:flutter_application_1/tabs/quran_tab.dart';
import 'package:flutter_application_1/tabs/radio_tab.dart';
import 'package:flutter_application_1/tabs/sebha_tab.dart';
import 'package:flutter_application_1/tabs/setting_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/flutter_localization.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static String routName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int index = 0;
  List<Widget> tabsList = [
    QuranTab(),
    Hadeethtab(),
    SebhaTab(),
    RadioTab(),
    Settings()
  ];
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Theme.of(context).colorScheme.brightness == Brightness.light
                        ? AppImages.bgLight
                        : AppImages.bgDark),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.islamy,
            ),
          ),
          body: tabsList[index],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              currentIndex: index,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.quranIcon)),
                    label: AppLocalizations.of(context)!.qurann),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.hadethIcon)),
                    label: AppLocalizations.of(context)!.hadeethe),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.SebhaIcon)),
                    label: AppLocalizations.of(context)!.sebhaa),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.radioIcon)),
                    label: AppLocalizations.of(context)!.radioo),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
              ]),
        ));
  }
}
