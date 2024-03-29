/// 存储在 shared_preferences 的数据
/// 使用方式 Global.prefs.xxx 进行 存储、读取、清除
class StorageKey {
  static const token = 'USER_TOKEN';
  static const email = 'USER_EMAIL';
  static const password = 'USER_PASSWORD';
  static const brandId = 'USER_BRAND_ID';
  static const locationId = 'USER_LOCATION_ID';
  // 深色模式： 0 关闭 1 开启 2 跟随系统
  static const themeMode = 'THEME_MODE';
}
