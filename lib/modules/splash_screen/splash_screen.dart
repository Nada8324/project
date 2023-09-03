import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:project/modules/signup_screen/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'AliMama',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 34,
                color: HexColor('#4A4E69')),
          ),
          Container(
            width: double.infinity,
            height: 369,
            child: Image(image: AssetImage('assets/images/shopping 1.png'),
            ),
          )
        ],
      ),
      backgroundColor: HexColor('#FEFEFE'),
      nextScreen: FirstPage(),
      splashIconSize: 500,
      duration: 3500,
    );
  }
}
