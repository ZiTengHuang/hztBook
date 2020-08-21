import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:tt_book/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  double allPrice;
  int allGoodsCount;

  List getData() {
    var cartInfo = SpUtil.getString('cartInfo');
    List dataInfo;
    if (null == cartInfo || cartInfo == '') {
      return [];
    }
    dataInfo = cartInfo is String ? json.decode(cartInfo) : cartInfo;
    allPrice = 0;
    allGoodsCount = 0;
    dataInfo.forEach((element) {
      if (element['isCheck']) {
        allPrice += (element['count'] * element ['price']);
        allGoodsCount += element['count'];
      }
    });

//    print(dataInfo);
//    print('=========');
//    print(dataInfo is String);
//    print(dataInfo[1]['shopId']);
//    print(dataInfo.length);
    notifyListeners();
    return dataInfo;
  }

  save({
    @required int shopId,
    @required double price,
    @required String shopName,
    @required int count,
    @required bool isCheck,
  }) {
    String cartString = SpUtil.getString('cartInfo');

    ///判断是否为null ,是就一个中括号 数组格式 ，不是就decode转化成list
    var temp = cartString == "" ? [] : json.decode(cartString);

    ///在转一次
    List<Map> tempList = (temp as List).cast();

    ///是否拥有这个id
    bool isHaveId = false;

    ///索引
    int valueIndex = 0;
    tempList.forEach((element) {
      ///这个节点中的id  和传进来的id一样
      if (element['shopId'] == shopId) {
        ///如果是一样 那就获取这个节点的item 的count 负值新的
        tempList[valueIndex]['count'] = element['count'] + 1;
        isHaveId = true;
      }
      valueIndex++;
    });

    /// 没拥有
    if (!isHaveId) {
      tempList.add({
        'shopId': shopId,
        'price': price,
        'shopName': shopName,
        'count': count,
        'isCheck': isCheck,
      });
    }
    cartString = json.encode(tempList).toString();
    SpUtil.putString('cartInfo', cartString);
    print(cartString);
    getData();
    notifyListeners();
  }

  deleteAll() {
    SpUtil.remove('cartInfo');
    print('=========清空完成=========');
    getData();
    allPrice = 0;
    allGoodsCount = 0;
    notifyListeners();
  }

  delete(int shopId) {
    String tempCart = SpUtil.getString('cartInfo');
    List cartInfo = (json.decode(tempCart) as List).cast();
    int targetIndex = 0;
    int deleteIndex = 0;
    cartInfo.forEach((element) {
      if (element['shopId'] == shopId) {
        targetIndex = deleteIndex;
      }
      deleteIndex++;
    });
    cartInfo.removeAt(targetIndex);

    String cartString = json.encode(cartInfo);
    SpUtil.putString('cartInfo', cartString);
    getData();
    notifyListeners();
  }
}
