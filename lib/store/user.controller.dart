import 'package:get/get.dart';

// 学习资料
// https://github.com/jonataslaw/getx/blob/master/documentation/zh_CN/state_management.md
class UserController extends GetxController {
  var user = <String, int>{}.obs;

  // // obx 方式调用
  // void add() => count++;
  // // 使用 getBuilder 方式
  void updateUser(value) {
    user.assignAll(value);
    update();
  }
}
