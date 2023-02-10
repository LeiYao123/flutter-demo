import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/components/button.dart';
import 'package:tablet/pages/testPage/animated_my_button.dart';
import 'package:tablet/pages/testPage/fade_in_out.dart';
import 'package:tablet/pages/testPage/orientation.dart';
import 'package:tablet/pages/testPage/watermark.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/utils/http.dart';
import 'package:tablet/utils/storage.dart';
import 'package:tablet/components/toast.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  void handleDio() async {
    // final d1 = Http();
    // final d2 = Http();
    // print(identical(d1, d2));
    final d3 = Http.dio;
    final d4 = Http.dio;
    // 测试 dio 实例
    print(identical(d3, d4));
  }

  void handleSetToken() {
    Global.prefs.setString(StorageKey.token, 'i am custom bear token');
  }

  void handleGetToken() async {
    final token = Global.prefs.getString(StorageKey.token);
    print('get $token');
  }

  void showToast() {
    Toast.errorBar(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试 widget 效果'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: <Widget>[
            RuButton('写入token', onPressed: handleSetToken),
            RuButton('获取token', onPressed: handleGetToken),
            RuButton('dio测试', onPressed: handleDio),
            RuButton('show toast', onPressed: showToast),
            ElevatedButton(
              child: const Text('sliver page SNH48'),
              onPressed: () => Get.toNamed(AppRoutes.sliver),
            ),
            ElevatedButton(
                onPressed: () {
                  // 横竖屏切换样式保持不变
                  // Get.to(() => OrientationDemo());
                  // 图片淡入淡出
                  // Get.to(() => const FadeInOutImage());
                  // 可变宽度按钮
                  // Get.to(() => const AnimatedMyButton());
                  // 水印效果
                  Get.to(() => const WaterMarkDemo());
                },
                child: const Text('效果'))
          ],
        ),
      ),
    );
  }
}
