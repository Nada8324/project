import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/modules/Home_screen/home_screen.dart';

class Layout_screen extends StatefulWidget {
  @override
  State<Layout_screen> createState() => _Layout_screenState();
}

class _Layout_screenState extends State<Layout_screen> {
  @override
  List<Widget> screens = [
    //screens
    Home_screen()
  ];
  int currentindex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: HexColor("#4A4E69"),
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: HexColor('#8F959E')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, color: HexColor('#8F959E')),
              label: 'Favorite'),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.shopping_bag_outlined, color: HexColor('#8F959E')),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,
                  color: HexColor('#8F959E')),
              label: 'Account'),
        ],
        selectedFontSize: 13,
        backgroundColor: HexColor("#1D1E2014"),
        showUnselectedLabels: false,
        iconSize: 30,
      ),
    );
  }
}
