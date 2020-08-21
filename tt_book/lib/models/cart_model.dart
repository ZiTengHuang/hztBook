class CartListModel {
  final List<CartModel> list;

  CartListModel({this.list});

  factory CartListModel.formJson(List jsonRes) {
    List<CartModel> data2 = [];
    //  data2.add(new CartModel(shopId: 123,price: 2324.3,shopName: "asdf",count: 3));
    for (var listItem in jsonRes) {
      data2.add(CartModel.fromJson(listItem));
    }
    print(data2.length);
    return CartListModel(list: data2);
  }
}

class CartModel {
  final int shopId;
  final double price;
  final String shopName;
  final int count;
  final bool isCheck;

  CartModel({this.shopId, this.price, this.shopName, this.count, this.isCheck});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      shopId: json['shopId'],
      price: json['price'],
      shopName: json['shopName'],
      count: json['count'],
      isCheck: json['isCheck'],
    );
  }
}
