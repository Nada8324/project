import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailSscreen extends StatefulWidget {


  @override
  State<DetailSscreen> createState() => _DetailSscreenState();
}

class _DetailSscreenState extends State<DetailSscreen> {

  bool size_item_pressed_1 = true;
  bool size_item_pressed_2 = false;
  bool size_item_pressed_3 = false;
  bool size_item_pressed_4 = false;
  bool size_item_pressed_5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 787,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: HexColor('#EDEDED'),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Stack(
                          children: [
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: Image(
                                image: AssetImage('assets/images/person_photo_1.png'),
                                width: 270,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Arrow - Left.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Bag.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0,right: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 9.0),
                              child: Text(
                                'Men\'s Printed Pullover Hoodie',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Nike Club Fleece',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '\$120',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 77,
                      child: Row(
                        children: [
                          ListView.separated(
                            itemBuilder: (context,index) => build_item_pictures_list(),
                            separatorBuilder: (context,index) => const SizedBox(
                              width: 26,
                            ),
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0,right: 23),
                    child: Row(
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Size Guide',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: HexColor('#EDEDED'),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'S',
                                style: TextStyle(
                                  color: size_item_pressed_1 ? Colors.black : Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          onTap: ()
                          {
                            list_size_item_pressed('S');
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: HexColor('#EDEDED'),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                list_size_item_pressed('M');
                              },
                              child: Text(
                                'M',
                                style: TextStyle(
                                  color: size_item_pressed_2 ? Colors.black : Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: HexColor('#EDEDED'),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                list_size_item_pressed('L');

                              },
                              child: Text(
                                'L',
                                style: TextStyle(
                                  color: size_item_pressed_3 ? Colors.black : Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: HexColor('#EDEDED'),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                list_size_item_pressed('XL');

                              },
                              child: Text(
                                'XL',
                                style: TextStyle(
                                  color: size_item_pressed_4 ? Colors.black : Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: HexColor('#EDEDED'),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                list_size_item_pressed('2XL');
                              },
                              child: Text(
                                '2XL',
                                style: TextStyle(
                                  color: size_item_pressed_5 ? Colors.black : Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'The Nike Throwback Pullover Hoodie is made from premium Hoodie is made from premium  terry fabric that blends a performance feel with',
                          style: TextStyle(
                            height: 1.2,
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),


                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 23),
                    child: Row(
                      children: [
                        const Text(
                          'Reviews',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        MaterialButton(
                          onPressed: () {  },
                          child: const Text(
                            'view All',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  ListView.separated(
                    itemBuilder: (context,index) => build_review_item(),
                    separatorBuilder: (context,index) => const SizedBox(
                      height: 25,
                    ),
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),

                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 145,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30.0,top: 20.0),
              child: Column(
                children: [
                  const Row(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'with VAT,SD',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '\$125',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),



                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: 330,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: HexColor('#4A4E69'),
                      ),
                      child: const Center(
                        child: Text(
                          'Add to cart ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget build_item_pictures_list() => Container(
    width: 77,
    height: 77,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: HexColor('#EDEDED'),
    ),
    child: const Image(
      image: AssetImage('assets/images/person_photo_1.png'),
      width: 270,
    ),
  );

  Widget build_item_size_list(String text) => Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: HexColor('#EDEDED'),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () { },
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
      ),
    ),
  );

  Widget build_review_item() => Padding(
    padding: const EdgeInsets.only(left: 20.0,right: 37),
    child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/portrait-handsome-man-with-dark-hairstyle-bristle-toothy-smile-dressed-white-sweatshirt-feels-very-glad-poses-indoor-pleased-european-guy-being-good-mood-smiles-positively-emotions-concept_273609-61405.jpg?size=626&ext=jpg&ga=GA1.1.986812089.1692619029&semt=ais',

              ),
              radius: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ronald Richards',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,

                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/clock.svg'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '13 Sep, 2020',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      '4.8',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'rating',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/active_star.svg'),
                    const SizedBox(
                      width: 2,
                    ),
                    SvgPicture.asset('assets/images/active_star.svg'),
                    const SizedBox(
                      width: 2,
                    ),
                    SvgPicture.asset('assets/images/active_star.svg'),
                    const SizedBox(
                      width: 2,
                    ),
                    SvgPicture.asset('assets/images/active_star.svg'),
                    const SizedBox(
                      width: 2,
                    ),
                    SvgPicture.asset('assets/images/non_active_star.svg'),
                  ],
                ),

              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'The Nike Throwback Pullover Hoodie is made from premium Hoodie is made from premium  terry fabric that blends a performance feel with',
          style: TextStyle(
            height: 1.2,
            color: Colors.grey,
            fontSize: 15,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),

      ],
    ),
  );

  void list_size_item_pressed(String label){

    if(label == 'S'){
      setState(() {
        size_item_pressed_1 = true;
        size_item_pressed_2 = false;
        size_item_pressed_3 = false;
        size_item_pressed_4 = false;
        size_item_pressed_5 = false;
      });

    }
    if(label == 'M'){
      setState(() {
        size_item_pressed_2 = true;
        size_item_pressed_1 = false;
        size_item_pressed_3 = false;
        size_item_pressed_4 = false;
        size_item_pressed_5 = false;
      });
    }
    if(label == 'L'){
      setState(() {
        size_item_pressed_3 = true;
        size_item_pressed_1 = false;
        size_item_pressed_2 = false;
        size_item_pressed_4 = false;
        size_item_pressed_5 = false;
      });
    }
    if(label == 'XL'){
      setState(() {
        size_item_pressed_4 = true;
        size_item_pressed_1 = false;
        size_item_pressed_3 = false;
        size_item_pressed_2 = false;
        size_item_pressed_5 = false;
      });
    }
    if(label == '2XL'){
      setState(() {
        size_item_pressed_5 = true;
        size_item_pressed_1 = false;
        size_item_pressed_3 = false;
        size_item_pressed_4 = false;
        size_item_pressed_2 = false;
      });
    }
  }
}