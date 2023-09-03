import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/modules/order_confirm/confirm.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;
  bool check_payment=true;
  bool check_address=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45, right: 20, left: 20,bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: CircleAvatar(
                        backgroundColor: HexColor('#F5F6FA'),
                        radius: 22.5,
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
                height: 25,
              ),
              Container(
                height: 260,
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? HexColor("#FEFEFE")
                                  : HexColor('#F5F6FA'),
                              borderRadius: BorderRadius.circular(10)),
                          height: 120,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: HexColor('#F5F6FA'),
                                      borderRadius:
                                          BorderRadius.circular(10)),
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
                                  width: 137,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Men\'s Tie-Dye T-Shirt Nike Sportswear',
                                        style: TextStyle(
                                            color: HexColor('#1D1E20'),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(
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
                                                  border: Border.all(
                                                      color: HexColor(
                                                          '#DEDEDE')),
                                                  color: Colors.white),
                                              width: 25,
                                              height: 25,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(
                                                        5.0),
                                                child: SvgPicture.asset(
                                                    'assets/images/Arrow - Down 4.svg'),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                            child: Text('${count}',
                                                style: TextStyle(
                                                    color:
                                                        HexColor('#1D1E20'),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          InkWell(
                                            onTap: () => setState(() {
                                              count++;
                                            }),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: HexColor(
                                                          '#DEDEDE')),
                                                  color: Colors.white),
                                              width: 25,
                                              height: 25,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(
                                                        5.0),
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
                                  child: InkWell(
                                    onTap: () {
                                      print('hkfjhk');
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: HexColor('#DEDEDE')),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: SvgPicture.asset(
                                            'assets/images/Delete.svg'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20),
                    itemCount: 3),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Delivery Address',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#1D1E20')),
                      ),
                      Spacer(),
                      InkWell(
                        child: SvgPicture.asset(
                            'assets/images/Arrow - Right 2.svg'),
                        onTap: () => print('tap'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Rectangle 584.jpg'))),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 10,
                            child: Center(
                                child: SvgPicture.asset(
                                    'assets/images/Location.svg')),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 202,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Chhatak, Sunamgonj 12/8AB',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: HexColor('#1D1E20')),
                                overflow: TextOverflow.ellipsis),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Sylhet',
                                style: TextStyle(
                                    color: HexColor('#8F959E'),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:check_address? HexColor('#4A4E69'):Colors.white),
                        width: 25,
                        height: 25,
                        child: InkWell(

                          onTap: () {
                            setState(() {
                              check_address = !check_address;
                            });
                          },
                          child: Center(
                              child: check_address? SvgPicture.asset('assets/images/check.svg'):SvgPicture.asset('assets/images/check.svg',color: HexColor('#4A4E69'),)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Payment Method',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#1D1E20')),
                      ),
                      Spacer(),
                      InkWell(
                        child: SvgPicture.asset(
                            'assets/images/Arrow - Right 2.svg'),
                        onTap: () => print('tap'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HexColor('#F5F6FA')),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Center(
                                child: SvgPicture.asset(
                                    'assets/images/visa.svg')),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 202,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Visa Classic',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: HexColor('#1D1E20')),
                                overflow: TextOverflow.ellipsis),
                            SizedBox(
                              height: 10,
                            ),
                            Text('**** 7690',
                                style: TextStyle(
                                    color: HexColor('#8F959E'),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:check_payment? HexColor('#4A4E69'):Colors.white),
                        width: 25,
                        height: 25,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              check_payment = !check_payment;
                            });
                          },
                          child: Center(
                              child: check_payment? SvgPicture.asset('assets/images/check.svg'):SvgPicture.asset('assets/images/check.svg',color: HexColor('#4A4E69'),)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Info',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: HexColor('#1D1E20')),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#8F959E')),
                      ),
                      Spacer(),
                      Text(
                        '\$110',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: HexColor('#1D1E20')),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Shipping cost',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#8F959E')),
                      ),
                      Spacer(),
                      Text(
                        '\$10',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: HexColor('#1D1E20')),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#8F959E')),
                      ),
                      Spacer(),
                      Text(
                        '\$120',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: HexColor('#1D1E20')),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 9),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Confirm_screen(),));
                    print('tap');
                  } ,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: HexColor('#4A4E69'),
                    ),
                    child: Center(
                      child: Text(
                        'Checkout',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget cartitem() {
    return Row(
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
                            'assets/images/Arrow - Down 4.svg',
                            color: HexColor('#8F959E')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            'assets/images/Arrow - Up 4.svg',
                            color: HexColor('#8F959E')),
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
          child: InkWell(
            onTap: () {
              print('hkfjhk');
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: HexColor('#DEDEDE')),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset('assets/images/Delete.svg',
                    color: HexColor('#8F959E')),
              ),
            ),
          ),
        )
      ],
    );
  }
}
