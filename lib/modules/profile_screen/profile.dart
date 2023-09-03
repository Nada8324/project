import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/modules/favorite_screen/fav.dart';
//import 'package:profile/constant.dart';
//import 'package:profile/login.dart';
//import 'package:profile/settind.dart';
import 'package:provider/provider.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../login_screen/login.dart';
import '../setting_screen/setting.dart';

//import 'components/button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 22.5,
                        backgroundImage:
                            AssetImage('assets/images/profile_pic.jpg')),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gousif',
                          style: TextStyle(
                              fontSize: 20,
                              color: HexColor('#1D1E20'),
                              fontWeight: FontWeight.w700),
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              'Verified Profile',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: HexColor('#8F959E'),
                                  fontWeight: FontWeight.w400),
                              maxLines: 2,
                            ),
                            SizedBox(width: 2,),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor('#4AC76D')),
                                width: 15,
                                height: 15,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: SvgPicture.asset(
                                      'assets/images/check.svg'),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: CircleAvatar(
                          backgroundColor: HexColor('#F5F6FA'),
                          radius: 22.5,
                          child: SvgPicture.asset('assets/images/Arrow - Left.svg')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: Container(
                //         height: 80,
                //         decoration: BoxDecoration(
                //           border: Border(
                //             top: BorderSide(
                //               color: Colors.grey,
                //             ),
                //             bottom: BorderSide(
                //               color: Colors.grey,
                //             ),
                //             right: BorderSide(
                //               color: Colors.grey,
                //             ),
                //             left: BorderSide(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   'Wallet',
                //                   style: TextStyle(
                //                       color: themeProvider.textcolor,
                //                       fontSize: 20.0,
                //                       fontWeight: FontWeight.w500),
                //                 ),
                //                 SizedBox(
                //                   height: 20,
                //                 ),
                //                 Text(
                //                   '500 LE',
                //                   style: TextStyle(
                //                       color: themeProvider.buttonscolor,
                //                       fontSize: 20),
                //                 ),
                //               ],
                //             ),
                //             VerticalDivider(
                //               thickness: 1,
                //               color: Colors.grey,
                //             ),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   'Spent',
                //                   style: TextStyle(
                //                       color: themeProvider.textcolor,
                //                       fontSize: 20.0,
                //                       fontWeight: FontWeight.w500),
                //                 ),
                //                 SizedBox(
                //                   height: 20,
                //                 ),
                //                 Text(
                //                   '500 LE',
                //                   style: TextStyle(
                //                       color: themeProvider.buttonscolor,
                //                       fontSize: 20),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10.0,
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: profileitem(
                    icon: Icon(Icons.favorite),
                    text: 'Your Favorite',
                    onthepresed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Fav_Screen(),));
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: profileitem(
                    icon: Icon(Icons.payment_outlined),
                    text: 'Payment',
                    onthepresed: () {},
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: profileitem(
                      icon: Icon(Icons.send),
                      text: 'Tell Your Freind',
                      onthepresed: () {}),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: profileitem(
                    icon: Icon(Icons.double_arrow),
                    text: 'Promotions',
                    onthepresed: () {},
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: profileitem(
                    icon: Icon(Icons.settings),
                    text: 'Settings',
                    onthepresed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TheSettingScreen()));
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: profileitem(
                    icon: Icon(Icons.logout),
                    text: 'Log Out',
                    onthepresed: () {
                      // TODO firebasehelper.signout
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
