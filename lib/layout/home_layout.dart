import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/layout/cubit/cubit.dart';
import 'package:project/layout/cubit/states.dart';
import 'package:project/modules/Home_screen/home_screen.dart';

class Layout_screen extends StatefulWidget {
  @override
  State<Layout_screen> createState() => _Layout_screenState();
}

class _Layout_screenState extends State<Layout_screen> {
  @override



  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){} ,
        builder: (context,state)
        {
         var cubit = ShopCubit.get(context);
          return Scaffold(
            backgroundColor: HexColor('#FEFEFE'),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home.svg'),label:''),
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/favorites.svg'),label:''),
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/cart.svg'),label:''),
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/profile.svg'),label:''),
              ],
              onTap: (index){
                cubit.changeIndex(index);
              },
              currentIndex: cubit.currentIndex,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        } ,
      ),
    );
  }
}
