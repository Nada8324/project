import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/home_layout.dart';
import 'package:project/modules/Home_screen/home_screen.dart';
import 'package:project/modules/cart_screen/cart.dart';

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
          Container(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    width: double.infinity,
                    child: Image(
                      image: AssetImage('assets/images/new layers.png'),color: HexColor('#DEEDFF'),
                      fit: BoxFit.fitWidth,
                    )),
                SvgPicture.asset(
                    'assets/images/undraw_order_confirmed_aaw7 1.svg',
                    height: 210,
                    width: 210),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Order Confirmed!',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#1D1E20')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 27, left: 27),
                child: Center(
                  child: Text(
                    'Your order has been confirmed, we will send you confirmation email shortly.',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: HexColor('#8F959E')),
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: HexColor('#F5F5F5'),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),)),
                        child: Center(
                            child: Text('Go to Orders',
                                style: TextStyle(
                                    color: HexColor('#8F959E'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: HexColor('#4A4E69'),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 9),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Layout_screen(),));
                        } ,

                        child: Center(
                          child: Text(
                            'Continue Shopping',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage('assets/images/Mask Group.png')),
          //     ),
          //     width: double.infinity,
          //     child: Column(
          //       children: [
          //         SvgPicture.asset(
          //             'assets/images/undraw_order_confirmed_aaw7 1.svg'),
          //         SizedBox(
          //           height: 30,
          //         ),
          //         Text('Order Confirmed!',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: HexColor('#1D1E20')),),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 10,right: 27,left: 27),
          //           child: Text('Your order has been confirmed, we will send you confirmation email shortly.',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: HexColor('#8F959E')),),
          //         ),
          //         SizedBox(
          //           height: 116,
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Container(
          //             height: 50,
          //             width: double.infinity,
          //
          //             decoration: BoxDecoration(color: HexColor('#F5F5F5'),borderRadius: BorderRadius.circular(10)),
          //             child: Center(child: Text('Go to Orders',style: TextStyle(color: HexColor('#8F959E'),fontSize:17 ,fontWeight: FontWeight.w500))),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
