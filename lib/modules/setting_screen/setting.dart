import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:profile/components/button.dart';
import 'package:provider/provider.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
// import 'constant.dart';

class TheSettingScreen extends StatefulWidget {
  const TheSettingScreen({super.key});

  @override
  State<TheSettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends State<TheSettingScreen> {
  bool isswitched = false;
  bool isswitched2 = false;
  bool isswitched3 = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22.5,
                      backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                    ),
                    Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: CircleAvatar(
                        backgroundColor: HexColor('#F5F6FA'),
                        radius: 25,
                        child: SvgPicture.asset('assets/images/Arrow - Left.svg'),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                      color: themeProvider.buttonscolor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.manage_accounts_outlined,
                      size: 30,
                      color: themeProvider.buttonscolor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                          color: themeProvider.buttonscolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: themeProvider.textcolor, fontSize: 20),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                          color: themeProvider.textcolor, fontSize: 20),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Privacy',
                      style: TextStyle(
                          color: themeProvider.textcolor, fontSize: 20),
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: themeProvider.buttonscolor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Notification',
                      style: TextStyle(
                          color: themeProvider.buttonscolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Notifications',
                      style: TextStyle(
                          color: themeProvider.textcolor, fontSize: 20),
                    ),
                    Spacer(),
                    Switch(
                        value: isswitched,
                        onChanged: (value) {
                          setState(() {
                            isswitched = value;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Updates',
                      style: TextStyle(
                          color: themeProvider.textcolor, fontSize: 20),
                    ),
                    Spacer(),
                    Switch(
                        value: isswitched2,
                        onChanged: (value) {
                          setState(() {
                            isswitched2 = value;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.miscellaneous_services_outlined,
                      color: themeProvider.buttonscolor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Others',
                      style: TextStyle(
                          color: themeProvider.buttonscolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      'Region',
                      style: TextStyle(
                          color: themeProvider.textcolor, fontSize: 20),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}