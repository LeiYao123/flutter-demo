import 'package:get/get.dart';

// 学习资料
// https://github.com/jonataslaw/getx/blob/master/documentation/zh_CN/state_management.md
class UserController extends GetxController {
  var user = <String, dynamic>{}.obs;

  // // 使用 getBuilder 方式
  void updateUser(Map<String, dynamic> value) {
    user.value = value;
    update();
  }
}
