import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:tt_book/value/AppConfigValue.dart';

/**
 * 通用逻辑
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class CommonUtils {
  static final double MILLIS_LIMIT = 1000.0;

  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static double sStaticBarHeight = 0.0;

//  static void initStatusBarHeight(context) async {
//    sStaticBarHeight = await FlutterStatusbar.height / MediaQuery.of(context).devicePixelRatio;
//  }

  static int getGridViewCount(int width, context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 15 * 2 + 10 * 2.0;
    double realWidth = screenWidth - padding;
    int count = (realWidth / width.toDouble()).floor();
    return count;
  }

//
//  static String getDateStr(DateTime date) {
//    if (date == null || date.toString() == null) {
//      return "";
//    } else if (date.toString().length < 10) {
//      return date.toString();
//    }
//    return date.toString().substring(0, 10);
//  }
//
//  static String getUserChartAddress(String userName) {
//    return Address.graphicHost + GSYColors.primaryValueString.replaceAll("#", "") + "/" + userName;
//  }
//
//  ///日期格式转换
//  static String getNewsTimeStr(DateTime date) {
//    int subTime = DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;
//
//    if (subTime < MILLIS_LIMIT) {
//      return "刚刚";
//    } else if (subTime < SECONDS_LIMIT) {
//      return (subTime / MILLIS_LIMIT).round().toString() + " 秒前";
//    } else if (subTime < MINUTES_LIMIT) {
//      return (subTime / SECONDS_LIMIT).round().toString() + " 分钟前";
//    } else if (subTime < HOURS_LIMIT) {
//      return (subTime / MINUTES_LIMIT).round().toString() + " 小时前";
//    } else if (subTime < DAYS_LIMIT) {
//      return (subTime / HOURS_LIMIT).round().toString() + " 天前";
//    } else {
//      return getDateStr(date);
//    }
//  }
//
//  static getLocalPath() async {
//    Directory appDir;
//    if (Platform.isIOS) {
//      appDir = await getApplicationDocumentsDirectory();
//    } else {
//      appDir = await getExternalStorageDirectory();
//    }
//    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
//    if (permission != PermissionStatus.granted) {
//      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//      if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
//        return null;
//      }
//    }
//    String appDocPath = appDir.path + "/gsygithubappflutter";
//    Directory appPath = Directory(appDocPath);
//    await appPath.create(recursive: true);
//    return appPath;
//  }
//
//  static saveImage(String url) async {
//    Future<String> _findPath(String imageUrl) async {
//      final cache = await CacheManager.getInstance();
//      final file = await cache.getFile(imageUrl);
//      if (file == null) {
//        return null;
//      }
//      Directory localPath = await CommonUtils.getLocalPath();
//      if (localPath == null) {
//        return null;
//      }
//      final name = splitFileNameByPath(file.path);
//      final result = await file.copy(localPath.path + name);
//      return result.path;
//    }
//
//    return _findPath(url);
//  }
//
//  static splitFileNameByPath(String path) {
//    return path.substring(path.lastIndexOf("/"));
//  }
//
//  static getFullName(String repository_url) {
//    if (repository_url != null && repository_url.substring(repository_url.length - 1) == "/") {
//      repository_url = repository_url.substring(0, repository_url.length - 1);
//    }
//    String fullName = '';
//    if (repository_url != null) {
//      List<String> splicurl = repository_url.split("/");
//      if (splicurl.length > 2) {
//        fullName = splicurl[splicurl.length - 2] + "/" + splicurl[splicurl.length - 1];
//      }
//    }
//    return fullName;
//  }
//
  static getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if(AppConfigValue.DEBUG) {
      return '${packageInfo.version}(${packageInfo.buildNumber})';
    }else{
      return '${packageInfo.version}';
    }
  }

  static getAppID() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.packageName}';
  }


  /** 复制到剪粘板 */
  static copyToClipboard(final String text) {
    if (text == null) return;
    Clipboard.setData(new ClipboardData(text: text));
  }
}
