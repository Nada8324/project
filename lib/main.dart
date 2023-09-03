// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:project/modules/Home_screen/home_screen.dart';
// import 'package:project/layout/home_layout.dart';
// import 'package:project/modules/details_screen/details.dart';
// import 'package:project/shared/remote/dio_helper.dart';
//
// void main() {
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           fontFamily: "Inter",
//           primarySwatch: Colors.blue,
//         ),
//         debugShowCheckedModeBanner: false, home: Layout_screen());
//   }
// }
import 'package:flutter/material.dart';
import 'package:project/layout/home_layout.dart';
import 'package:project/modules/splash_screen/splash_screen.dart';

import 'package:project/shared/components/constants.dart';
import 'package:project/shared/remote/dio_helper.dart';

import 'package:provider/provider.dart';

import 'modules/profile_screen/profile.dart';

void main() {
  DioHelper.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      home:SplashScreen(),
    );
  }
}
