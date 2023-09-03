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
    return AnimatedSplashScreen(splash: Column(
      children: [
        
       Text('Shopzen',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: HexColor('#4A4E69')),),
         SvgPicture.asset('assets/images/shopping 1.svg',width: 100,height: 100,)
      ],
    ),
    backgroundColor: HexColor('#f6f1ed')
    , nextScreen: FirstPage(),splashIconSize: 500,duration: 3500,);
  }
}
