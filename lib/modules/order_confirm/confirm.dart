import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Confirm_screen extends StatelessWidget {
  const Confirm_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 20.0),
            child: InkWell(
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
          ),
          SizedBox(
            height: 55,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Mask Group.png')),
              ),
              width: double.infinity,
              child: Stack(
                children: [
                  SvgPicture.asset('assets/images/Mask Group.svg',
                      color: HexColor('#DEEDFF')),
                  Center(
                      child: SvgPicture.asset(
                          'assets/images/undraw_order_confirmed_aaw7 1.svg')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
