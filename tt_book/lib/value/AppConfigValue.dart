
class AppConfigValue {
 static const String SHOW_GUILD_TIPS = 'showGuildTips';
 static const isRelease = bool.fromEnvironment("dart.vm.product");
 static const DEBUG = !isRelease;
}
