import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Details_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  child: Image(
                image: NetworkImage(
                    'https://i.dummyjson.com/data/products/2/3.jpg'),
                    fit: BoxFit.fitHeight,
              ),
                width: double.infinity,

              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: FaIcon(FontAwesomeIcons.arrowLeft,
                          color: Colors.grey[600]),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(17),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: FaIcon(FontAwesomeIcons.bagShopping,
                          color: Colors.grey[600]),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(17),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('description',style: TextStyle(
                      color: HexColor('#8F959E'),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                    Text('title',style: TextStyle(
                      color: HexColor('##1D1E20'),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    Row(
                      children: [
                        Container(),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
