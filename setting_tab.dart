import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/App_colors.dart';
import 'package:flutter_application_1/common/ThemeManger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/flutter_localization.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.mode),
                Expanded(
                  child: SwitchListTile(
                    value: provider.isDark,
                    onChanged: (value) {
                      provider.changThemeMode(
                          value ? ThemeMode.dark : ThemeMode.light);
                    },
                    activeColor: AppColors.goldcolor,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.languages),
            trailing: DropdownButton(
                underline: Container(),
                value: 'en',
                items: [
                  DropdownMenuItem(
                    child: Text('English'),
                    value: 'en',
                  ),
                  DropdownMenuItem(
                    child: Text('عربي'),
                    value: 'ar',
                  )
                ],
                onChanged: (value) {
                 if(value!=null) {provider.changAppLocale(value);}
                }),
          )
        ],
      ),
    );
  }
}
