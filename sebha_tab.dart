import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/App_colors.dart';
import 'package:flutter_application_1/common/app_images.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int countNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 59),
                child: Image.asset(
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? AppImages.sebhaHead
                        : AppImages.sebhaHeadDark),
              )),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 79),
                  child: Image.asset(Theme.of(context).colorScheme.brightness ==
                          Brightness.light
                      ? AppImages.sebhaLogo
                      : AppImages.sebhaLogoDark),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('عدد التسبيحات'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary),
                onPressed: () {
                  countNumber++;
                  if (countNumber > 33) {
                    countNumber = 0;
                  }
                  setState(() {});
                },
                child: Text(countNumber.toString())),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.mainLightcolor,
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'سبحان الله',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
    void checkNumber() {
      if (countNumber > 33) {
        countNumber = 0;
      }
    }
  }
}
