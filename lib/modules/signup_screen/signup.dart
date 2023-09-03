import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/modules/login_screen/login.dart';
import 'package:project/modules/register_screen/register.dart';

class FirstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f6f1ed'),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150,),
           SvgPicture.asset('assets/images/illustration 1.svg'),
            Text(
              'Shop Now!',
              style: TextStyle(fontSize: 30, color:  HexColor('#4A4E69')),
            ),
            SizedBox(height: 70,),
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
            SizedBox(height: 15,),
            Row( 
              children: [
                SizedBox(width: 110,),
                Text('Have an account? '),
                GestureDetector(
                  onTap: () {
                  
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn()),
            );
          },child: Text(
            'Log in',
            style: TextStyle(
              fontSize: 18,

              color: HexColor('#4A4E69'),

            ),
          ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}