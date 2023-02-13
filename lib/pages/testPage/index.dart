import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/components/button.dart';
import 'package:tablet/pages/testPage/animated_my_button.dart';
import 'package:tablet/pages/testPage/fade_in_out.dart';
import 'package:tablet/pages/testPage/orientation.dart';
import 'package:tablet/pages/testPage/watermark.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/style/theme.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/utils/http.dart';
import 'package:tablet/utils/storage.dart';
import 'package:tablet/components/toast.dart';

final tempColor = RuColor.black;

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _themeMode = 2;

  void handleDio() async {
    // final d1 = Http();
    // final d2 = Http();
    // print(identical(d1, d2));
    final d3 = Http.dio;
    final d4 = Http.dio;
    // 测试 dio 实例
    print(identical(d3, d4));
  }

  @override
  void initState() {
    print('get==>${Get.isDarkMode}');
    int mode = Global.prefs.getInt(StorageKey.themeMode) ?? 2;
    print('mode $mode');
    setState(() {
      _themeMode = mode;
    });
    super.initState();
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
    print('tempColor $tempColor  原始color ${RuColor.black}');
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
              style: ElevatedButton.styleFrom(foregroundColor: RuColor.black),
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
              child: const Text('效果'),
            ),
            const Divider(),
            Center(
                child: Text('测试颜色RuColor.black',
                    style: TextStyle(color: RuColor.black))),
            Center(
                child: Text('测试颜色RuColor.blue',
                    style: TextStyle(color: RuColor.blue))),
            const Divider(),
            ListTile(
              title: const Text('跟随系统'),
              trailing: Switch(
                value: _themeMode == 2,
                onChanged: (bool value) {
                  _themeMode = value ? 2 : 0;
                  setState(() {});
                  AppTheme.changeThemeMode(_themeMode);
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('普通模式'),
              trailing: Switch(
                value: _themeMode == 0,
                onChanged: (bool value) {
                  _themeMode = value ? 0 : 1;
                  setState(() {});
                  AppTheme.changeThemeMode(_themeMode);
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('深色模式'),
              trailing: Switch(
                value: _themeMode == 1,
                onChanged: (bool value) {
                  _themeMode = value ? 1 : 0;
                  setState(() {});
                  AppTheme.changeThemeMode(_themeMode);
                },
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
