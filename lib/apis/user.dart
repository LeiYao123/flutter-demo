import 'package:tablet/utils/api.dart';

class UserApi {
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
}
