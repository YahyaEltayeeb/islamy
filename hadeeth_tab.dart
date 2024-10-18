import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/app_images.dart';
import 'package:flutter_application_1/screens/hadeeth_screen.dart';
import 'package:flutter_application_1/common/App_theme.dart';

class Hadeethtab extends StatefulWidget {
  const Hadeethtab({super.key});

  @override
  State<Hadeethtab> createState() => _HadeethtabState();
}

class _HadeethtabState extends State<Hadeethtab> {
  List<HadeethModel> hadeethModelList = [];

  @override
  Widget build(BuildContext context) {
    if (hadeethModelList.isEmpty) {
      loadAhadeeth();
    }
    return Column(
      children: [
        Image.asset(
          AppImages.hadeethlogo,
          height: MediaQuery.of(context).size.height * .25,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(HadeethScreen.routName,
                      arguments: hadeethModelList[index]);
                },
                child: Text(
                  hadeethModelList[index].name,
                  style: TextStyle(),
                ),
              ),
            ),
            itemCount: hadeethModelList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 2,
              );
            },
          ),
        ),
      ],
    );
  }

  loadAhadeeth() async {
    List<HadeethModel> _hadeethModelList = [];

    String data = await rootBundle.loadString('assets/images/hadeeth/ahadeth.txt');
    List<String> hadeethList = data.trim().split('#');
    hadeethList.removeWhere(
      (element) => element.trim().isEmpty,
    );
    for (var i = 0; i < hadeethList.length; i++) {
      int index = hadeethList[i].trim().indexOf('\n');
      String name = hadeethList[i].trim().substring(0, index);
      String content = hadeethList[i].trim().substring(index + 1);
      print('name:$name');
      print('content:$content');
      _hadeethModelList.add(HadeethModel(name: name, content: content));
    }
    hadeethModelList = _hadeethModelList;
    setState(() {});
  }
}

class HadeethModel {
  String name;
  String content;
  HadeethModel({
    required this.name,
    required this.content,
  });
}
