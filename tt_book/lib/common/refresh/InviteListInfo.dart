import 'dart:convert';

class InviteListInfo extends Object {
  int total;//累计邀请总人数
  List<InviteInfo> list;

  InviteListInfo.fromParams({
    this.total,
    this.list
  });

  factory InviteListInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
      ? new InviteListInfo.fromJson(json.decode(jsonStr))
      : new InviteListInfo.fromJson(jsonStr);

  InviteListInfo.fromJson(jsonRes) {
    total = jsonRes['total']??0;

    list = [];
    for (var listItem in jsonRes['list']) {
      list.add(listItem == null ? null : new InviteInfo.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"total": $total,"list": $list}';
  }
}
//奖品信息
class InviteInfo {
  String userId;
  String beInvitedId;
  double invitedOrderMoney;
  double money;
  String invitationDate;
  String obtainDate;
  String beInvitedMobile;
  int state; //0邀请已发出，1已接受邀请
  int type; //0红包收益，1推广收益

  InviteInfo.fromParams(
      {
        this.userId,
        this.beInvitedId,
        this.invitedOrderMoney,
        this.money,
        this.invitationDate,
        this.obtainDate,
        this.beInvitedMobile,
        this.state,
        this.type,
      });

  InviteInfo.fromJson(jsonRes) {
    userId = jsonRes['userId']??'';
    beInvitedId = jsonRes['beInvitedId']??'';
    invitedOrderMoney = jsonRes['invitedOrderMoney']??0.0;
    money = jsonRes['money']??0.0;
    invitationDate = jsonRes['invitationDate']??'';
    obtainDate = jsonRes['obtainDate']??'';
    beInvitedMobile = jsonRes['beInvitedMobile']??'';
    state = jsonRes['state']??0;
    type = jsonRes['type']??0;
  }
  String phoneStr(){
    return beInvitedMobile.substring(0,3)+'******'+beInvitedMobile.substring(beInvitedMobile.length-2);
  }
  getStatusStr(){
    return '已接受邀请';
  }
  bool isRester(){
    return type == 0;
  }
  @override
  String toString() {
    return 'InviteInfo{userId: $userId, beInvitedId: $beInvitedId,invitedOrderMoney: $invitedOrderMoney, money: $money,invitationDate: $invitationDate, beInvitedMobile: $beInvitedMobile, state: $state'
        ', type: $type}';
  }
}