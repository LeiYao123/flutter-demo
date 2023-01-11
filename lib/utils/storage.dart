import 'package:tablet/utils/global.dart';

class LocalToken {
  static setToken(String token) async {
    return await Global.prefs.setString('token', token);
  }

  static getToken(String token) {
    return Global.prefs.getString('token');
  }

  static removeToken(String token) async {
    return await Global.prefs.remove('counter');
  }
}
