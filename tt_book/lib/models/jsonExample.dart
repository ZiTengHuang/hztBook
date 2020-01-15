
import 'dart:convert';

class JsonExample {

  String  _jsonString ='''{
    "msg": "成功",
    "code": 200,
    "data": [
      {
        "level": 1,
        "icon_temp": "http://47.104.232.111/img/u/2019/08/22/2REM.png",
        "sort_num": 1,
        "uplevelId": 0,
        "name": "K金项链",
        "icon": "img/u/2019/08/22/2REM.png",
        "id": 2,
        "productList": [
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/C9MD.png",
            "productCategoryId": 2,
            "price": 1788.0,
            "goodsId": 110,
            "name": "心上人系列项链  18K金 钻石项链  个性定制",
            "caption": null,
            "id": 110,
            "sn": "17",
            "stock": 999,
            "sales": 14
          },
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/VD3S.png",
            "productCategoryId": 2,
            "price": 1889.0,
            "goodsId": 109,
            "name": "18K金 彩贝套链  七彩项链  七色彩虹",
            "caption": null,
            "id": 109,
            "sn": "16",
            "stock": 999,
            "sales": 14
          },
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/XGC3.png",
            "productCategoryId": 2,
            "price": 1888.0,
            "goodsId": 113,
            "name": "18K金 红宝石套链  会滑动的遇见项链",
            "caption": null,
            "id": 113,
            "sn": "20",
            "stock": 1998,
            "sales": 13
          },
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/MZIE.png",
            "productCategoryId": 2,
            "price": 1688.0,
            "goodsId": 111,
            "name": "18K金 钻石灵动套链  精美礼盒项链",
            "caption": null,
            "id": 111,
            "sn": "18",
            "stock": 999,
            "sales": 13
          },
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/NVOE.png",
            "productCategoryId": 2,
            "price": 1899.0,
            "goodsId": 114,
            "name": "18K金 红宝石套链  遇见项链  会滑动的项链",
            "caption": null,
            "id": 114,
            "sn": "21",
            "stock": 999,
            "sales": 7
          }
        ]
      },
      {
        "level": 1,
        "icon_temp": "http://47.104.232.111/img/u/2019/08/22/TXM2.png",
        "sort_num": 2,
        "uplevelId": 0,
        "name": "K金戒指",
        "icon": "img/u/2019/08/22/TXM2.png",
        "id": 17,
        "productList": [
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/S7IV.png",
            "productCategoryId": 17,
            "price": 2988.0,
            "goodsId": 112,
            "name": "18K金 红/蓝宝石戒指  遇见戒指  遇见最美的你",
            "caption": null,
            "id": 112,
            "sn": "19",
            "stock": 999,
            "sales": 14
          },
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/P2HU.png",
            "productCategoryId": 17,
            "price": 1299.0,
            "goodsId": 105,
            "name": "18K金钻石戒指  嘟嘟戒指",
            "caption": null,
            "id": 105,
            "sn": "12",
            "stock": 999,
            "sales": 4
          }
        ]
      },
      {
        "level": 1,
        "icon_temp": "http://47.104.232.111/img/u/2019/08/22/D7AR.png",
        "sort_num": 3,
        "uplevelId": 0,
        "name": "宝石吊坠",
        "icon": "img/u/2019/08/22/D7AR.png",
        "id": 1,
        "productList": [
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/S35I.png",
            "productCategoryId": 1,
            "price": 0.1,
            "goodsId": 106,
            "name": "【测试专用，下单不发货】18K金 钻石吊坠  嘟嘟吊坠",
            "caption": null,
            "id": 106,
            "sn": "13",
            "stock": 965,
            "sales": 60
          },
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/GR7O.png",
            "productCategoryId": 1,
            "price": 1999.0,
            "goodsId": 107,
            "name": "18K金 钻石吊坠  嘟嘟吊坠  个性设计",
            "caption": null,
            "id": 107,
            "sn": "14",
            "stock": 979,
            "sales": 25
          },
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/RPAQ.png",
            "productCategoryId": 1,
            "price": 1588.0,
            "goodsId": 108,
            "name": "18K金 钻石套链  嘟嘟项链",
            "caption": null,
            "id": 108,
            "sn": "15",
            "stock": 996,
            "sales": 8
          }
        ]
      },
      {
        "level": 1,
        "icon_temp": "http://47.104.232.111/img/u/2019/08/22/ID7N.png",
        "sort_num": 4,
        "uplevelId": 0,
        "name": "耳饰",
        "icon": "img/u/2019/08/22/ID7N.png",
        "id": 4,
        "productList": [
          {
            "thumbnail": "http://47.104.232.111/img/u/2019/08/15/LKPQ.png",
            "productCategoryId": 4,
            "price": 1588.0,
            "goodsId": 104,
            "name": "18K金钻石耳钉  嘟嘟耳钉",
            "caption": null,
            "id": 104,
            "sn": "1", 
            "stock": 1996,
            "sales": 38
          }
        ]
      }
    ]
  }''';

   void sendJsonPrint(){
     Map<String,dynamic> map = JsonCodec().decode(_jsonString);
     print('code : ${map['code']}');
  }
}