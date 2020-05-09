import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储///
const String SHOW_PERFORMANCE_OVERLAY = 'showPerformanceOverlay';
const String CHECKER_BOARD_RASTER_CACHE_IMAGES = 'checkerboardRasterCacheImages';
const String CHECKER_BOARD_OFFSCREEN_LAYERS = 'checkerboardOffscreenLayers';
const String SHOW_SEMANTICS_DEBUGGER = 'showSemanticsDebugger';
const String DEBUG_SHOW_CHECKED_MODE_BANNER = 'debugShowCheckedModeBanner';
const String DEBUG_SHOW_MATERIAL_GRID = 'debugShowMaterialGrid';
const String SHOW_GUILD_TIPS = 'showGuildTips';
const String CURRENT_HOST_URL = 'CurrentHostUrl';
const String CURRENT_PORT = 'currentHost';
const String PROXY_HOST = 'proxyHost';
const String IS_PROXY_OPEN = 'isProxyOpen';
const String PROXY_PORT = 'ProxyPort';
const String IS_PASSED = 'isPassed';

class LocalStorage {
  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value.runtimeType == double) {
      prefs.setDouble(key, value);
    } else if (value.runtimeType == String) {
      prefs.setString(key, value);
    } else if (value.runtimeType == bool) {
      prefs.setBool(key, value);
    } else if (value.runtimeType == int) {
      prefs.setInt(key, value);
    }
  }

  static getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  static getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
