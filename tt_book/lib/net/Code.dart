import 'package:event_bus/event_bus.dart';

///错误编码
class Code {
  ///成功
  static const SUCCESS = 200;

  ///网络错误
  static const NETWORK_ERROR = 400;

  ///网络超时
  static const NETWORK_TIMEOUT = 404;

  ///服务器错误
  static const SERVICE_ERROR = 500;

  ///服务器不可用
  static const INVALUABLE_SERVICE = 502;

  ///网络返回数据格式化错误
  static const NETWORK_JSON_EXCEPTION = -1;

  //自定义网络错误码
  static const CUSTOM_NETWORK_ERROR = 1400;


  static final EventBus eventBus = new EventBus();

  ///判断是否 = 401 =402 发送消息
  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    eventBus.fire(new HttpErrorEvent(code, message));
    return message;
  }
}

class HttpErrorEvent {
  final int code;

  final String message;

  HttpErrorEvent(this.code, this.message);
}
