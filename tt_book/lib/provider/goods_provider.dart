import 'package:flutter/material.dart';


class GoodsProvider extends  ChangeNotifier{

  double price = 0;

  get() => price;

  void add(price){
     this.price += price;
     ///通知刷新
     notifyListeners();
  }

}