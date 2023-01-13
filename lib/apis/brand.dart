import 'package:tablet/utils/http.dart';

class BrandApi {
  // 发送验证码
  static Future getBrand() async {
    return await Http.dio.get('api/cp/user/brands').then((value) => value.data);
  }
}
