import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/modules/login_screen/login.dart';
import 'package:project/modules/register_screen/register.dart';

class FirstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 96,
          ),
          Text(
            'AliMama',
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700, color:  HexColor('#4A4E69')),
          ),
          SizedBox(height: 28,),
         Image(image: AssetImage('assets/images/illustration 1.png')),
          SizedBox(
            height: 22,
          ),
          Center(
            child: Text(
              'Get Your Stuffs Here !',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700, color:  HexColor('#090A0A')),
            ),
          ),
          SizedBox(height: 37,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:  HexColor('#4A4E69'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minimumSize: Size(200, 50),
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Text(
              'Create account',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 17,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Have an account?'),
              GestureDetector(
                onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogIn()),
          );
        },child: Text(
          'Log in',
          style: TextStyle(
            fontSize: 15,
            color: HexColor('#4A4E69'),
          ),
        ),
              )
            ],
          )
        ],
      ),
    );
  }
}