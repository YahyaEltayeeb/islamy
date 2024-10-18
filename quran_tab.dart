import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/Quran_model.dart';
import 'package:flutter_application_1/common/app_images.dart';
import 'package:flutter_application_1/screens/quran_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/flutter_localization.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  List<int> virsesCount = [];
  @override
  Widget build(BuildContext context) {
    if (virsesCount.isEmpty) loadSuras();
    return Stack(children: [
      Align(
          alignment: Alignment.center,
          child: VerticalDivider(
            indent: MediaQuery.of(context).size.height * .30,
          )),
      Column(
        children: [
          Image.asset(AppImages.quranLogo),
          Divider(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(AppLocalizations.of(context)!.suraNames,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                  )),
              Text(AppLocalizations.of(context)!.counts,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30))
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(QuranScreen.routName,
                        arguments:
                            QuranModel(name: suraNames[index], index: index));
                  },
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Text(
                            suraNames[index],
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            virsesCount[index].toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: suraNames.length,
            ),
          )
        ],
      ),
    ]);
  }

  loadSuras() async {
    List<int> _virsesCount = [];
    for (var i = 0; i < suraNames.length; i++) {
      String data = await rootBundle
          .loadString('assets/images/quran/qurann/${i + 1}.txt');
      List<String> content = data.trim().split('\n');
      content.removeWhere((element) => element.isEmpty);
      _virsesCount.add(content.length);
    }
    virsesCount = _virsesCount;
    setState(() {});
  }
}
