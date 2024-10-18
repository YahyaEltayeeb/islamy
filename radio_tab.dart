import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_images.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(AppImages.radioLogo)),
        Text(
          'اذاعه القران الكريم',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Center(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * .03),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .1),
                    child: Icon(
                      Icons.skip_previous,
                      size: 80,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.09),
                    child: Icon(
                      Icons.play_arrow,
                      size: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.skip_next,
                      size: 80,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
