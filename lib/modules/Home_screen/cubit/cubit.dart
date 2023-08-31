import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/layout/cubit/states.dart';
import 'package:project/modules/Home_screen/cubit/states.dart';
import 'package:project/modules/cart_screen/cart.dart';
import 'package:project/modules/favorite_screen/fav.dart';
import 'package:project/modules/profile_screen/profile.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/remote/dio_helper.dart';

class ShopHomeCubit extends Cubit<ShopHomeStates>
{
  ShopHomeCubit() :super(ShopHomeInitialState());


  static ShopHomeCubit get(context) => BlocProvider.of(context);



  List<dynamic> cat = [];
  var categories = [];


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
  }



}