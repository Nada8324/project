import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/cubit/states.dart';
import 'package:project/layout/model/category_model.dart';
import 'package:project/layout/model/product_modedl.dart';
import 'package:project/modules/cart_screen/cart.dart';
import 'package:project/shared/components/constants.dart';
import 'package:project/shared/remote/dio_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:project/shared/remote/endpoint.dart';

import '../../layout/cubit/cubit.dart';
import '../category_screen/category.dart';
import '../setting_screen/setting.dart';

class Home_screen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final search_text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 25,
            right: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: CircleAvatar(
                        backgroundColor: HexColor('#F5F6FA'),
                        radius: 25,
                        child: SvgPicture.asset('assets/images/menu.svg')),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TheSettingScreen(),
                          ));
                    },
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: CircleAvatar(
                        backgroundColor: HexColor('#F5F6FA'),
                        radius: 25,
                        child: SvgPicture.asset(
                          'assets/images/cart.svg',
                          color: Colors.black,
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hello',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Welcome to AliMama.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: HexColor('#8F959E')),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('#F5F6FA'),
                      ),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: search_text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(search_text.text);
                          },
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: HexColor('#8F959E')),
                          decoration: InputDecoration(
                            prefixIcon: SvgPicture.asset(
                              'assets/images/Search.svg',
                              height: 20,
                              width: 20,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Search...',
                            contentPadding: EdgeInsets.all(15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // show in data grid this item
                      }
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('4A4E69'),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/Search.svg',
                        color: Colors.white,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Choose Category',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      print('View All Pressed');
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: HexColor('#8F959E')),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 55,
                child: ConditionalBuilder(
                  condition: ShopCubit.get(context).cat?.data.category != null,
                  builder: (context) {
                    return ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var model = ShopCubit.get(context).cat;
                        CategoryModel? c = model!.data.category[index];
                        return categoryBuilder(
                            '${c.image}', '${c.name}', context, c.id);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount:
                          ShopCubit.get(context).cat!.data.category.length,
                    );
                  },
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'New Arraival',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      print('View All Pressed');
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: HexColor('#8F959E')),
                    ),
                  ),
                ],
              ),
              ConditionalBuilder(
                condition:
                    ShopCubit.get(context).product?.data.products != null,
                builder: (context) {
                  var model = ShopCubit.get(context).product;
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        ProductModel? p = model.data.products[index];
                        return productItemBuilder(
                            '${p.image}', '${p.name}', '${p.old_price}\$');
                      },
                      itemCount: model!.data.products.length,
                      padding: EdgeInsets.zero,
                    ),
                  );
                },
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productItemBuilder(String image, String label, String price) => Column(
        children: [
          Expanded(
            child: Container(
              height: 203,
              width: 165,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: HexColor('#F2F2F2')),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    child: Image(
                      image: NetworkImage(image),
                      fit: BoxFit.scaleDown,
                    ),
                    width: 165,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: SvgPicture.asset('assets/images/Heart.svg'),
                      onTap: () {
                        print('Like Tapped');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Colors.black)),
              const SizedBox(
                height: 5,
              ),
              Text(price,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black)),
            ],
          ),
        ],
      );
  Widget categoryBuilder(String photo, String text, context, id) => InkWell(
        onTap: () {
          ShopCubit.get(context).getProductByCategory(id);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Category_screen(),
              ));
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor('#F5F6FA')),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Image(image: NetworkImage(photo)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      );
}

/*  @override*/
/*  void initState() {
    super.initState();
    getproducts();

    // SmartPhones();
    // Laptops();
    // Fragrances();
    // SkinCare();
    // Groceries();
    // HomeDecoration();
  }

  List<dynamic> cat = [];
  var categories = [];

  bool favourite = false;
  var iconkey = GlobalKey();
  var scaffoldkey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: HexColor('#FEFEFE'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.grey[900],
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(17),
                  backgroundColor: Colors.grey[200],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: FaIcon(FontAwesomeIcons.bagShopping,
                    color: Colors.grey[900]),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(17),
                  backgroundColor: Colors.grey[200],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
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
                            return buildcategoryitem(index);
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
                        itemBuilder: (context, index) {
                          return buildd(index * 2);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemCount: ((products.length) / 2).round(),
                      ),
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

  Widget buildd(index) {
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
                        image: NetworkImage('${products[index]['thumbnail']}'),
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
                  '${products[index]['title']}',
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
                      '${(products[index]['price'] - ((products[index]['discountPercentage'] / 100) * products[index]['price'])).round()}',
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
                      '${products[index]['price']}',
                      style: TextStyle(
                          color: HexColor('#1D1E20'),
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'dicount ${products[index++]['discountPercentage']}% OFF',
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
                        image: NetworkImage('${products[index]['thumbnail']}'),
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
                  '${products[index]['title']}',
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
                      '${(products[index]['price'] - ((products[index]['discountPercentage'] / 100) * products[index]['price'])).round()}',
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
                      '${products[index]['price']}',
                      style: TextStyle(
                          color: HexColor('#1D1E20'),
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'dicount ${products[index]['discountPercentage']}% OFF',
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

  Widget buildcategoryitem(index) {
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
          '${categories[index]}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: HexColor("#1D1E20"),
          ),
        ),
      ),
    );
  }

  void getproducts() {
    DioHelper.get(
      url: 'products',
    ).then((value) {
      products = value.data['products'];
      products.forEach((element) {
        cat.add(element['category']);
      });
      categories = cat.toSet().toList();
    });
  }*/
// List<dynamic> smartPhones = [];
// List<dynamic> laptops = [];
// List<dynamic> fragrances = [];
// List<dynamic> skinCare = [];
// List<dynamic> groceries = [];
// List<dynamic> home_decoration = [];
//
// void SmartPhones() {
//   products.forEach((element) {
//     if (element['category'] == 'smartphones') smartPhones.add(element);
//   });
//   print(smartPhones.length);
// }
//
// void Laptops() {
//   products.forEach((element) {
//     if (element['category'] == 'laptops') laptops.add(element);
//   });
//   print(laptops.length);
// }
//
// void Fragrances() {
//   products.forEach((element) {
//     if (element['category'] == 'fragrances') fragrances.add(element);
//   });
//   print(fragrances.length);
// }
//
// void SkinCare() {
//   products.forEach((element) {
//     if (element['category'] == 'skincare') skinCare.add(element);
//   });
//   print(skinCare.length);
// }
//
// void Groceries() {
//   products.forEach((element) {
//     if (element['category'] == 'groceries') groceries.add(element);
//   });
//   print(groceries.length);
// }
//
// void HomeDecoration() {
//   products.forEach((element) {
//     if (element['category'] == 'home-decoration')
//       home_decoration.add(element);
//   });
//   print(home_decoration.length);
// }
