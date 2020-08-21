import 'package:easy_localization/easy_localization.dart';
import 'package:fbutton/fbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_book/costom/DivideOutItem.dart';
import 'package:tt_book/models/cart_model.dart';
import 'package:tt_book/widget/customer/AppTitleBar.dart';
import 'package:tt_book/widget/provide/CartProvider.dart';

class CartTextPage extends StatefulWidget {
  @override
  _CartTextPageState createState() => _CartTextPageState();
}

class _CartTextPageState extends State<CartTextPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(context: context, title: '购物车逻辑', centTitle: true),
      body: Stack(
        children: <Widget>[
          Consumer<CartProvider>(builder: (_, notifier, __) {
            CartListModel _cartListModel =
                CartListModel.formJson(notifier.getData());
            return Container(
              child: ListView.builder(
                  itemCount: _cartListModel.list.length,
                  itemBuilder: (_, index) {
                    return _item(index, _cartListModel.list);
                  }),
            );
          }),
          Consumer<CartProvider>(builder: (_, notifier, __) {
            return Align(
                alignment: Alignment(0, 1),
                child: Container(
                  height: 120,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 60,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                              activeColor: Colors.pink,
                            ),
                            Expanded(flex: 1, child: Text('全选')),
                            Row(
                              children: <Widget>[
                                Text('合计：'),
                                Text(
                                  '¥ ${notifier.allPrice.toString()}',
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(''),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 68,
                              width: 80,
                              alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '结算（${notifier.allGoodsCount.toString() ?? 0}）',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          FButton(
                            text: 'save',
                            height: 30,
                            width: 80,
                            alignment: Alignment.center,
                            corner: FCorner.all(12),
                            color: Colors.lightBlue,
                            onPressed: () {
                              notifier.save(
                                  shopId: 123,
                                  price: 555.5,
                                  shopName: '问问伽马',
                                  count: 5,
                                  isCheck: true);
                            },
                          ),
                          FButton(
                            text: 'delete',
                            height: 30,
                            width: 80,
                            alignment: Alignment.center,
                            corner: FCorner.all(12),
                            color: Colors.lightBlue,
                            onPressed: () {
                              notifier.deleteAll();
                            },
                          ),
                          FButton(
                            text: 'addRow',
                            height: 30,
                            width: 80,
                            alignment: Alignment.center,
                            corner: FCorner.all(12),
                            color: Colors.lightBlue,
                            onPressed: () {
                              notifier.save(
                                  shopId: notifier.getData().length,
                                  price: 555.5,
                                  shopName: '问问伽马',
                                  count: 5,
                                  isCheck: true);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          }),
        ],
      ),
    );
  }

  _item(int index, List dataInfo) {
    return Consumer<CartProvider>(builder: (_, notifier, __) {
      return Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            _cartCheckBox(dataInfo[index].isCheck),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text('价格：${dataInfo[index].price.toString()}'),
                  Container(
                    height: 40,
                    width: 80,
                    child: DivideOutItem(
                      min: 1,
                      max: 22,
                      step: 1,
                      numberLength: 0,
                      number: dataInfo[index].count.toString(),
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.radio_button_checked),
                onPressed: () {
                  notifier.delete(dataInfo[index].shopId);
                }),
            Text('${dataInfo[index].shopName}'),
          ],
        ),
      );
    });
  }

  _cartCheckBox(isCheck) {
    return Container(
      child: Checkbox(
        value: isCheck,
        onChanged: (value) {},
        activeColor: Colors.pink,
      ),
    );
  }
}
