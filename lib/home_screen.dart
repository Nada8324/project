import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: HexColor('#FEFEFE'),
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: CircleAvatar(
              child: IconButton(onPressed:(){
              },icon: Icon(Icons.menu,color: Colors.grey[900])),
              radius: 22.5,
              backgroundColor: Colors.grey[200],
            ),
            actions:
            [
              CircleAvatar(
              child: IconButton(onPressed: (){

              }
              ,icon: Icon(Icons.card_travel,color: Colors.grey[900])),
              radius: 22.5,
              backgroundColor: Colors.grey[200],
            ),
           ]
            ,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text('HELLO',style: TextStyle(
                color:HexColor("#1D1E20"),
                 fontWeight: FontWeight.w600,
                 fontSize: 28,
                fontFamily: ('Inter'),
              ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Welcome to Laza.',style: TextStyle(
                color:HexColor("#8F959E"),
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: ('Inter'),
              ),
              ),
              SizedBox(
              height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 275,
                      height: 50,

                      child: TextFormField(

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: ("Search...") ,
                          border: InputBorder.none
                        ),

                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor("#F5F6FA"),

                      ),
                    ),
                  ),
                 SizedBox(
                   width: 10,
                 ),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        color: HexColor("#4A4E69"),
                      ),

                        child: IconButton(onPressed: (){}, icon:
                         Icon(
                       Icons.search,
                      color: HexColor("#FEFEFE"),
                    ),
                        ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),


          ],
          ),
        ),
    ),
      );
  }
}
