import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/cubit/states.dart';
import 'package:project/layout/model/product_modedl.dart';
import 'package:project/modules/cart_screen/cart.dart';
import 'package:project/modules/favorite_screen/fav.dart';
import 'package:project/modules/profile_screen/profile.dart';
import 'package:project/shared/remote/endpoint.dart';

import '../../modules/Home_screen/home_screen.dart';
import '../../shared/remote/dio_helper.dart';
import '../model/category_model.dart';

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

  Product? product;
  void getHomeData() {
    emit(ShopHomeDataLoading());
    DioHelper.get(
      url: Home,
      token:
          'b676yF4HQTAGtP9bYNM2kjAw3VZ6vd63Ar7dr7jQvhISokVKIK5K3Emr4tiPctOBgBlZhV',
    ).then((value) {
      product = Product.fromJson(value.data);
      emit(ShopHomeDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(ShopHomeDatafail());
    });
  }

  Category? cat;
  void getCategory() {
    emit(ShopCategoryDataLoading());
    DioHelper.get(
      url: category,
    ).then((value) {
      cat = Category.fromJson(value.data);
      emit(ShopCategoryDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(ShopCategoryDatafail());
    });
  }

  void getProductByCategory() {
    emit(ShopCategoryDataLoading());
    DioHelper.get(
      url: category,
    ).then((value) {
      cat = Category.fromJson(value.data);
      emit(ShopCategoryDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(ShopCategoryDatafail());
    });
  }
}
