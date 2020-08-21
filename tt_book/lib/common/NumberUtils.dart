///Created by Seven on 2018/12/4.
///数操作
class NumberUtils {
  ///保留小数位数
  static getDouble(double number,int length) {
    if (length == 0){
      return number.toInt();
    }
    String sn = number.toStringAsFixed(length);
    return double.parse(sn);
  }
}