import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../layout/model/product_by_category.dart';
import '../../layout/model/product_modedl.dart';
import '../cart_screen/cart.dart';

class Category_screen extends StatefulWidget {
  const Category_screen({super.key});

  @override
  State<Category_screen> createState() => _Category_screenState();
}

class _Category_screenState extends State<Category_screen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Column(children: [
                SizedBox(
                  height: 45,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: CircleAvatar(
                          backgroundColor: HexColor('#F5F6FA'),
                          radius: 25,
                          child: SvgPicture.asset(
                              'assets/images/Arrow - Left.svg'),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "category name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: HexColor('#1D1E20')),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: CircleAvatar(
                            backgroundColor: HexColor('#F5F6FA'),
                            radius: 25,
                            child: SvgPicture.asset(
                              'assets/images/cart.svg',
                              color: HexColor('#1D1E20'),
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(),
                              ));
                        },
                      ),
                    ]),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${ShopCubit.get(context).productByCategory!.data.products.length}',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#1D1E20')),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Available in stock",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: HexColor('#8F959E'),
                              fontSize: 15),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 37,
                      width: 68,
                      decoration: BoxDecoration(
                        color: HexColor('#F5F6FA'),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/images/Edit.svg'),
                          label: Text(
                            "Edit",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: HexColor('#1D1E20')),
                          )),
                    )
                  ],
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var model = ShopCubit.get(context).productByCategory;
                    ProductbycategoryModel? p = model?.data.products[index];
                    return productItemBuilder(
                        '${p?.image}', '${p?.name}', '${p?.old_price}\$');
                  },
                  itemCount: ShopCubit.get(context)
                      .productByCategory!
                      .data
                      .products
                      .length,
                  padding: EdgeInsets.zero,
                ),
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
              width: 160,
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
          Text(label,
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
      );
}
