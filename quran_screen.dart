import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/Quran_model.dart';
import 'package:flutter_application_1/common/app_images.dart';
import 'package:flutter_application_1/tabs/quran_tab.dart';
import 'package:flutter_application_1/common/App_theme.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});
  static String routName = 'QuranScreen';

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<String> virses = [];
  @override
  Widget build(BuildContext context) {
    QuranModel quranModel =
        ModalRoute.of(context)!.settings.arguments as QuranModel;
    if (virses.isEmpty) loadSuraContent(quranModel.index);

    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? AppImages.bgLight
                        : AppImages.bgDark),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            centerTitle: true,
            title: Text(
              'islamy',
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.02,
                horizontal: MediaQuery.of(context).size.width * .03),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background.withOpacity(.7),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Text(
                  quranModel.name,
                  style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                ),
                Divider(
                  indent: MediaQuery.of(context).size.width * .20,
                  thickness: 5,
                  endIndent: MediaQuery.of(context).size.width * .20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        virses[index],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    itemCount: virses.length,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> loadSuraContent(index) async {
    String data = await rootBundle
        .loadString('assets/images/quran/qurann/${index + 1}.txt');
    virses = data.split('\n');
    setState(() {});
  }
}
