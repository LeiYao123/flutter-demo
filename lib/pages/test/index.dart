import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tablet/components/button.dart';
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
    LocalToken.setToken('i am custom bear token');
  }

  void handleGetToken() async {
    final token = await LocalToken.getToken('token');
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
      body: Center(
        child: Wrap(
          spacing: 12,
          children: <Widget>[
            RuButton('写入token', onPressed: handleSetToken),
            RuButton('获取token', onPressed: handleGetToken),
            RuButton('dio测试', onPressed: handleDio),
            RuButton('show toast', onPressed: showToast),
          ],
        ),
      ),
    );
  }
}
