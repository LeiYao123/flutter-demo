import 'package:get/get.dart';

// 学习资料
// https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md
// https://juejin.cn/post/6924104248275763208
// 状态管理认知 https://juejin.cn/post/6924104248275763208
class TestController extends GetxController {
  var count = 0.obs;
  // obx 方式调用
  void add() => count++;
  // 使用 getBuilder 方式
  void sub() {
    count--;
    update();
  }
}
