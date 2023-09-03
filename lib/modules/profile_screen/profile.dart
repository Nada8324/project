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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 22.5,
                        backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                      ),
                    ),
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
                              color: themeProvider.textcolor,
                              fontWeight: FontWeight.w700),
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Text('Verified Profile',style:TextStyle(
                              color: HexColor('#8F959E'),
                              fontSize: 15,fontWeight: FontWeight.w400
                            ),),
                            SizedBox(width: 5,),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                  children: [
                                  SvgPicture.asset('assets/images/Star 6.svg'),
                                    SvgPicture.asset('assets/images/check.svg'),
                                  ],
                        ),
                            )
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: themeProvider.buttonscolor,
                        )),
                  ],
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // Expanded(
                //     //   child: Container(
                //     //     height: 80,
                //     //     decoration: BoxDecoration(
                //     //       border: Border(
                //     //         top: BorderSide(
                //     //           color: Colors.grey,
                //     //         ),
                //     //         bottom: BorderSide(
                //     //           color: Colors.grey,
                //     //         ),
                //     //         right: BorderSide(
                //     //           color: Colors.grey,
                //     //         ),
                //     //         left: BorderSide(
                //     //           color: Colors.grey,
                //     //         ),
                //     //       ),
                //     //     ),
                //     //     child: Row(
                //     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     //       children: [
                //     //         Column(
                //     //           mainAxisAlignment: MainAxisAlignment.center,
                //     //           children: [
                //     //             Text(
                //     //               'Wallet',
                //     //               style: TextStyle(
                //     //                   color: themeProvider.textcolor,
                //     //                   fontSize: 20.0,
                //     //                   fontWeight: FontWeight.w500),
                //     //             ),
                //     //             SizedBox(
                //     //               height: 20,
                //     //             ),
                //     //             Text(
                //     //               '500 LE',
                //     //               style: TextStyle(
                //     //                   color: themeProvider.buttonscolor,
                //     //                   fontSize: 20),
                //     //             ),
                //     //           ],
                //     //         ),
                //     //         VerticalDivider(
                //     //           thickness: 1,
                //     //           color: Colors.grey,
                //     //         ),
                //     //         Column(
                //     //           mainAxisAlignment: MainAxisAlignment.center,
                //     //           children: [
                //     //             Text(
                //     //               'Spent',
                //     //               style: TextStyle(
                //     //                   color: themeProvider.textcolor,
                //     //                   fontSize: 20.0,
                //     //                   fontWeight: FontWeight.w500),
                //     //             ),
                //     //             SizedBox(
                //     //               height: 20,
                //     //             ),
                //     //             Text(
                //     //               '500 LE',
                //     //               style: TextStyle(
                //     //                   color: themeProvider.buttonscolor,
                //     //                   fontSize: 20),
                //     //             ),
                //     //           ],
                //     //         ),
                //     //       ],
                //     //     ),
                //     //   ),
                //     // ),
                //     SizedBox(
                //       width: 10.0,
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 30.0,
                ),
                profileitem(
                  icon: Icon(Icons.favorite),
                  text: 'Your Favorite',
                  onthepresed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Fav_Screen(),));
                  },
                ),
                profileitem(
                  icon: Icon(Icons.payment_outlined),
                  text: 'Payment',
                  onthepresed: () {},
                ),
                profileitem(
                    icon: Icon(Icons.send),
                    text: 'Tell Your Freind',
                    onthepresed: () {}),
                profileitem(
                  icon: Icon(Icons.double_arrow),
                  text: 'Promotions',
                  onthepresed: () {},
                ),
                profileitem(
                  icon: Icon(Icons.settings),
                  text: 'Settings',
                  onthepresed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TheSettingScreen()));
                  },
                ),
                profileitem(
                  icon: Icon(Icons.logout),
                  text: 'Log Out',
                  onthepresed: () {
                    // TODO firebasehelper.signout
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogIn()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
