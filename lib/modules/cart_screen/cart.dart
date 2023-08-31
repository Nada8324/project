import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 58,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: CircleAvatar(
                      backgroundColor: HexColor('#F5F6FA'),
                      radius: 25,
                      child:
                          SvgPicture.asset('assets/images/Arrow - Left.svg')),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 104,
                ),
                Center(
                  child: Text(
                    'Cart',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: HexColor('#1D1E20')),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Container(
              color: HexColor("#FEFEFE"),
              height: 120,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: HexColor('#F5F6FA'),
                          borderRadius: BorderRadius.circular(10)),
                      height: 100,
                      width: 100,
                      child: Image(
                        image: NetworkImage(
                            'https://i.ebayimg.com/images/g/JKcAAOSwfnNhvhfQ/s-l1600.jpg'),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 100,
                      width: 137,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Men\'s Tie-Dye T-Shirt Nike Sportswear',
                            style: TextStyle(
                                color: HexColor('#1D1E20'),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'EGP price',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: HexColor('#8F959E')),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => setState(() {
                                  count--;
                                }),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor('#DEDEDE'),
                                  ),
                                  width: 25,
                                  height: 25,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SvgPicture.asset(
                                        'assets/images/Arrow - Down 4.svg'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text('${count}',
                                    style: TextStyle(
                                        color: HexColor('#1D1E20'),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600)),
                              ),
                              InkWell(
                                onTap: () => setState(() {
                                  count++;
                                }),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor('#DEDEDE'),
                                  ),
                                  width: 25,
                                  height: 25,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SvgPicture.asset(
                                        'assets/images/Arrow - Up 4.svg'),
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor('#DEDEDE')
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                              'assets/images/Delete.svg'),

                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
