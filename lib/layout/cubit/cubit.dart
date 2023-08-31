import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/cubit/states.dart';
import 'package:project/modules/cart_screen/cart.dart';
import 'package:project/modules/favorite_screen/fav.dart';
import 'package:project/modules/profile_screen/profile.dart';

import '../../modules/Home_screen/home_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    //screens
    Home_screen(),
    Fav_Screen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ShopBottomNavBarChangeState());
  }
}
