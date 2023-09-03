import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/modules/Home_screen/home_screen.dart';
import 'package:project/layout/home_layout.dart';
import 'package:project/modules/details_screen/details.dart';
import 'package:project/modules/signup_screen/signup.dart';
import 'package:project/modules/splash_screen/splash_screen.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/remote/dio_helper.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        theme: themeProvider.themeData,
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
