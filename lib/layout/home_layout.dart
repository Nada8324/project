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
import 'package:project/modules/cart_screen/cart.dart';
import 'package:project/modules/profile_screen/profile.dart';
import 'package:project/shared/components/components.dart';

class Layout_screen extends StatefulWidget {
  @override
  State<Layout_screen> createState() => _Layout_screenState();
}

class _Layout_screenState extends State<Layout_screen> {
  @override

  List<BottomNavigationBarItem> HomeSelected = [
  const BottomNavigationBarItem(icon: Text('Home',style: TextStyle(fontSize: 11 ,fontWeight: FontWeight.w500),),label:''),
  BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/favorites.svg'),label:''),
  BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/cart.svg'),label:''),
  BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/profile.svg'),label:''),
  ];
  List<BottomNavigationBarItem> FavoriteSelected = [
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home.svg'),label:''),
    const BottomNavigationBarItem(icon: Text('Favorites',style: TextStyle(fontSize: 11 ,fontWeight: FontWeight.w500),),label:''),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/cart.svg'),label:''),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/profile.svg'),label:''),
  ];

  List<BottomNavigationBarItem> others = [
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home.svg'),label:''),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/favorites.svg'),label:''),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/cart.svg'),label:''),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/profile.svg'),label:''),
  ];




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
              selectedFontSize: 0,
              unselectedFontSize:0 ,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              items: cubit.currentIndex == 0 ? HomeSelected : (cubit.currentIndex == 1 ? FavoriteSelected : others) ,
              onTap: (index){
                if(index == 0 || index == 1) {
                  cubit.changeIndex(index);
                }
                else if(index ==2)
                  {
                    navigateTo(context, CartScreen());
                  }
                else
                  {
                    navigateTo(context, ProfileScreen());
                  }

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
