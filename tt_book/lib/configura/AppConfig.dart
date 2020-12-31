
class AppConfig{
  factory AppConfig ()=> _getInstance();

  static AppConfig get instance => _getInstance();
  static AppConfig _instance;
  AppConfig._internal();

  static AppConfig _getInstance() {
    if (_instance == null) {
      _instance = AppConfig._internal();

    }
    return _instance;
  }
}