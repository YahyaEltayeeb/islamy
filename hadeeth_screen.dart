import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_images.dart';
import 'package:flutter_application_1/tabs/hadeeth_tab.dart';

class HadeethScreen extends StatelessWidget {
  const HadeethScreen({super.key});
  static String routName = 'HadeethScreen';
  @override
  Widget build(BuildContext context) {
     HadeethModel hadeethModel =
        ModalRoute.of(context)!.settings.arguments as HadeethModel;
    return  Container(
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
                  hadeethModel.name,
                  style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                ),
                Divider(
                  indent: MediaQuery.of(context).size.width * .20,
                  thickness: 5,
                  endIndent: MediaQuery.of(context).size.width * .20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeethModel.content,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  ),
                
              ],
            ),
          ),
        ));
  }
 }
