import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';

class SplachScreenn extends StatelessWidget {
  const SplachScreenn({super.key});
  static const String routName = '/';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),
        () => Navigator.of(context).pushNamed(HomeScreen.routName));
    return Image.asset(
      'assets/images/splash.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
