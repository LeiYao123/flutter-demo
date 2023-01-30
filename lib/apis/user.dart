import 'package:get/get.dart';
import 'package:tablet/store/user.controller.dart';
import 'package:tablet/utils/http.dart';

class UserApi {
  // 登录
  static Future login({
    String? email,
    String? password,
    String? phone,
    String? code,
  }) async {
    Map form = email != null
        ? {"email": email, "password": password}
        : {"phone": phone, "verification_code": code};
    form.addAll({"role_type": "brand"});
    return await Http.dio
        .post('api/auth/login', data: form)
        .then((value) => value.data);
  }

  // 发送验证码
  static Future sendCode({required String phone}) async {
    return await Http.dio.post(
      'api/auth/send_code',
      data: {"role_type": "brand", "phone": phone},
    ).then((value) => value.data);
  }

  static Future getProfile(String brandId) async {
    return await Http.dio.get('api/cp/user?brand_id=$brandId').then((value) {
      try {
        final data = value.data?['data'] ?? {};
        final UserController uc = Get.find<UserController>();
        uc.updateUser(data);
      } catch (e) {
        print('catch getProfile => $e');
      }
    });
  }
}
