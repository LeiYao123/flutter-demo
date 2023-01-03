import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  void add() => count++;
  // 使用 getBuilder 方式
  void sub() {
    count--;
    update();
  }
}
