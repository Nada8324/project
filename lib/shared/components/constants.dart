
import 'package:flutter/material.dart';
List<dynamic> products = [];
class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;
  Color textcolor = Colors.black;
  Color buttonscolor = Color(0xff8f959e);
  String text = 'Dark Mode';
  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;
  void toggleTheme() {
    if (textcolor == Colors.black) {
      textcolor = Colors.white;
      buttonscolor = Colors.white;
      text = "Light Mode";
    } else {
      textcolor = Colors.black;
      buttonscolor = Color(0xff8f959e);
      text = "Dark Mode";
    }

    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
);

