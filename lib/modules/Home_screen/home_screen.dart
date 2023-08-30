import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  bool favourite = false;
  var iconkey = GlobalKey();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: HexColor('#FEFEFE'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child:
                FaIcon(FontAwesomeIcons.user,color: Colors.grey[900],),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(17),
                  backgroundColor: Colors.grey[200],
                ),
              ),
              Spacer(),
              ElevatedButton(onPressed: (){}, child: FaIcon(FontAwesomeIcons.bagShopping,color: Colors.grey[900])  ,
                style: ElevatedButton.styleFrom(shape: CircleBorder(),
                  padding: EdgeInsets.all(17),
                  backgroundColor: Colors.grey[200],
                ),

              ),
            ],
          ),
          SizedBox(
            height:5,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:35,
                    ),
                    Text(
                      'HELLO',
                      style: TextStyle(
                        color: HexColor("#1D1E20"),
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: ('Inter'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Welcome to Laza.',
                      style: TextStyle(
                        color: HexColor("#8F959E"),
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
                                  labelText: ("Search..."),
                                  border: InputBorder.none),
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
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
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
                    Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              color: HexColor('#1D1E20'),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            scaffoldkey.currentState!.showBottomSheet(
                              (context) => Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.red,
                                child: Text('knk'),
                                decoration: BoxDecoration(),
                              ),
                              backgroundColor: Colors.blue,
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.all(Radius.circular(20)),
                              // ),
                            );
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: HexColor('#8F959E'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return buildcategoryitem();
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 10.0,
                            );
                          },
                          itemCount: 6),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'All Products',
                      style: TextStyle(
                        color: HexColor('#1D1E20'),
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => buildd(),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15,
                              ),
                          itemCount: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildd() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://i.dummyjson.com/data/products/1/2.jpg'),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                favourite = !favourite;
                              });
                            },
                            icon: Icon(
                              favourite
                                  ? (Icons.favorite)
                                  : (Icons.favorite_border),
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'title',
                  style: TextStyle(
                    color: HexColor('#1D1E20'),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'EGP',
                      style: TextStyle(
                        color: HexColor('#1D1E20'),
                        fontWeight: FontWeight.w200,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '123',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: HexColor('#1D1E20'),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'price',
                      style: TextStyle(
                          color: HexColor('#1D1E20'),
                          fontWeight: FontWeight.w200,
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'dicount % OFF',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Text('rating',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.white,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              print("hgfhh");
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://i.dummyjson.com/data/products/1/2.jpg'),
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                favourite = !favourite;
                              });
                            },
                            icon: Icon(
                                favourite
                                    ? (Icons.favorite)
                                    : (Icons.favorite_border),
                                color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'title',
                  style: TextStyle(
                    color: HexColor('#1D1E20'),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'EGP',
                      style: TextStyle(
                        color: HexColor('#1D1E20'),
                        fontWeight: FontWeight.w200,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '123',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: HexColor('#1D1E20'),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'price',
                      style: TextStyle(
                          color: HexColor('#1D1E20'),
                          fontWeight: FontWeight.w200,
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'dicount % OFF',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Text('rating',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.white,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget buildcategoryitem() {
    return Container(
      height: 50,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HexColor("#F5F6FA"),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'smartphones',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: HexColor("#1D1E20"),
          ),
        ),
      ),
    );
  }
}
