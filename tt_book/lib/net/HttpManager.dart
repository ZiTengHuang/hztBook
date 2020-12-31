//
//import 'dart:io';
//
//import 'package:dio/dio.dart';
//
//import 'package:package_info/package_info.dart';
//
//import 'Code.dart';
//
//enum METHOD {
//  POST,
//  GET,
//  PUT,
//  DEL
//}
//
//enum CONTENT_TYPE {
//  JSON,
//  FORM,
//  FORMDATA,
//}
//
/////http请求
//class HttpManager {
//  static const CONTENT_TYPE_JSON = "application/json;charset=UTF-8";
//  static const CONTENT_TYPE_FORM =
//      "application/x-www-form-urlencoded; charset=UTF-8";
//  static const CONTENT_TYPE_FORM_DATA =
//      "multipart/form-data";
//
//  static const TIMEOUT = 15000;
//
//  static Map optionParams = {
//    "timeoutMs": TIMEOUT,
//  };
//
//  static Options baseOption() {
//    return Options(
//        baseUrl: AppConfig().currentHostUrl,
//        receiveTimeout: TIMEOUT,
//        connectTimeout: TIMEOUT,
//        contentType: ContentType.parse(CONTENT_TYPE_FORM));
//  }
//
//  static Options postOption() {
//    return baseOption().merge(method: 'post');
//  }
//
//  static Options formPostOption() {
//    return postOption()
//        .merge(contentType: ContentType.parse(CONTENT_TYPE_FORM));
//  }
//
//  static Options jsonPostOption() {
//    return postOption()
//        .merge(contentType: ContentType.parse(CONTENT_TYPE_JSON));
//  }
//
//  ///发起网络请求
//  ///[ url] 请求url
//  ///[ params] 请求参数
//  ///[ header] 外加头
//  ///[ option] 配置
//  ///[ noTip] 是否需要重新登陆
//  ///[ needLogin ] 是否需要登陆传token
//  ///[ contentType ] 请求类型
//  ///[ CancelToken ] 取消令牌
//  ///[ outsideRequest ] 请求的手机型号
//  static request(header, Options option,
//      {baseUrl,
//        url,
//      params,
//      noTip = false,
//      method = METHOD.POST,
//      needLogin = true,
//      contentType = CONTENT_TYPE.JSON,
//      CancelToken cancelToken,bool outsideRequest = false}) async {
//    assert(url != null, "url must be not null");
//
//    ///没有网络
//    var connectivityResult = await (new Connectivity().checkConnectivity());
//    if (connectivityResult == ConnectivityResult.none) {
//      return new ResultData(
//          Code.errorHandleFunction(Code.NETWORK_ERROR, "网络没有连接", noTip),
//          false,
//          Code.NETWORK_ERROR);
//    }
//
//    /// 初始化头部map
//    Map<String, String> headers = new Map();
//    /// 初始化包管理工具
//    PackageInfo packageInfo = await PackageInfo.fromPlatform();
//    ///获取版本号
//    String localVersion = packageInfo.version;
//    ///头部添加版本号
//    headers.addAll({'version':localVersion});
//
//    if(!outsideRequest){
//      headers.addAll({'User-Agent': Platform.isIOS ? 'iPhone' : 'Android'});
//    }
//
//    if (header != null) {
//      headers.addAll(header);
//    }
//
//    if (needLogin) {
//      ///通过用户存储类来获取信息
//      UserLoginInfo loginInfo = await UserStorage.getLoginInfo();
//      if (null != loginInfo && loginInfo.token.isNotEmpty) {
//        headers.addAll(
//            {'token': '${loginInfo.token}'});
//      }
//    }
//
//    if (option == null) {
//      option = baseOption();
//
//      if(baseUrl != null){
//        option.baseUrl = baseUrl;
//      }
//      if (null != headers) {
//        option = option.merge(headers: headers);
//      }
//
//      if (contentType == CONTENT_TYPE.JSON) {
//        print('json');
//        option =
//            option.merge(contentType: ContentType.parse(CONTENT_TYPE_JSON));
//      } else if (contentType == CONTENT_TYPE.FORMDATA) {
//        print('json');
//        option =
//            option.merge(contentType: ContentType.parse(CONTENT_TYPE_FORM_DATA));
//      } else {
//        print('form');
//        option =
//            option.merge(contentType: ContentType.parse(CONTENT_TYPE_FORM));
//      }
//      if (method == METHOD.POST) {
//        option = option.merge(method: 'post');
//      } else if (method == METHOD.GET) {
//        option = option.merge(method: 'get');
//      } else if (method == METHOD.PUT) {
//        option = option.merge(method: 'put');
//      } else if (method == METHOD.DEL) {
//        option = option.merge(method: 'delete');
//      }
//    } else {
//      print('headers:$headers');
//      option = option.merge(headers: header);
//      print('$url 请求头:${option?.headers}');
//    }
//
//    if (AppConfig.DEBUG) {
//      print('请求url:$url');
//      print('method:${option?.method}');
//      print('$url 请求头:${option?.headers}');
//      print("content-type:${option?.contentType}");
//      if (params != null) {
//        print('请求参数:${params?.toString()}');
//      }
//    }
//    int beginTime = DateTime.now().millisecondsSinceEpoch;
//
//
//    Dio dio;
//   if(AppConfig().isOpenProxy){
//      dio= new Dio()..onHttpClientCreate = (client){
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) {
//         return AppConfig().isOpenProxy ;
//       };
//       client.findProxy = (url) {
//         return AppConfig().isOpenProxy ? 'PROXY ${AppConfig().proxyHost+':'+AppConfig().proxyPort}' : 'DIRECT';
//       };
//     };
//   }else{
//     dio = Dio();
//   }
//    Response response;
//    try {
//      response = await dio.request(url,
//          data: params, options: option, cancelToken: cancelToken);
//    } on DioError catch (e) {
//      if (AppConfig.DEBUG) {
//        print('$url 请求异常:${e?.message}');
//        print('$url 请求异常: ${e?.response?.data}');
//      }
//
//      Response errorResponse;
//      if (e.response != null) {
//        errorResponse = e.response;
//      } else {
//        errorResponse = new Response(statusCode: Code.CUSTOM_NETWORK_ERROR);
//      }
//      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
//        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
//      }
//      return new ResultData(
//          e.type == DioErrorType.CANCEL
//              ? null
//              : Code.errorHandleFunction(
//                  errorResponse.statusCode, e?.message, noTip),
//          false,
//          errorResponse.statusCode,
//          isCancel: e.type == DioErrorType.CANCEL);
//    }
//
//    if (AppConfig.DEBUG) {
//      if (response != null) {
//        int responseTime = DateTime.now().millisecondsSinceEpoch;
//        int feeTime = responseTime - beginTime;
//        print('url:$url 响应时间：${feeTime}ms 返回结果:${response.data}');
//      }
//    }
//
//    try {
//      if (response.statusCode == Code.SUCCESS || response.statusCode == 201) {
//        return new ResultData(response.data, true, Code.SUCCESS);
//      }
//    } catch (e) {
//      print("exception:${e.toString()}$url");
//      return new ResultData(response.data, false, response.statusCode);
//    }
//
//    return new ResultData(
//        Code.errorHandleFunction(response.statusCode, "数据请求错误", noTip),
//        false,
//        response.statusCode);
//
//  }
//}
