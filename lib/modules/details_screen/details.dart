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
          Row(
            children: [
              ElevatedButton(onPressed: (){}, child: FaIcon(FontAwesomeIcons.arrowLeft,color: Colors.grey[900])  ,
                style: ElevatedButton.styleFrom(shape: CircleBorder(),
                  padding: EdgeInsets.all(17),
                  backgroundColor: Colors.white,
                ),
              ),
              Spacer(),
              ElevatedButton(onPressed: (){}, child: FaIcon(FontAwesomeIcons.bagShopping,color: Colors.grey[900])  ,
                style: ElevatedButton.styleFrom(shape: CircleBorder(),
                  padding: EdgeInsets.all(17),
                  backgroundColor: Colors.white,
                ),

              ),

            ],
          ),

        ],
      ),
    );
  }
}
