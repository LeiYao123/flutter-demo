import 'package:flutter/material.dart';
import 'package:tablet/components/button.dart';
import 'package:tablet/utils/api.dart';
import 'package:tablet/utils/storage.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  void handleDio() async {
    print('handleDio');
    // Http()
    //     .getDio()
    //     .get('https://www.baidu.com/')
    //     .then((value) => {print('dio 响应$value')});

    // final d1 = Http();
    // final d2 = Http();
    // print(identical(d1, d2));
    // final d3 = Http.dio;
    // d3.get('https://www.baidu.com/').then((value) => {print('dio 响应$value')});
    // // print('http--dio$d3');
    // Http.dio
    //     .get('https://www.baidu.com/')
    //     .then((value) => {print('dio 响应$value')});
    final res = await Http.dio.get('https://www.baidu.com/');
    print('res--$res');
  }

  void handleSetToken() {
    LocalToken.setToken('i am custom bear token');
  }

  // void handleGetToken() async {
  //   final token = await LocalToken.getToken('token');
  //   print('get $token');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试 widget 效果'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RuButton('写入token', onPressed: handleSetToken),
            // RuButton('获取token', onPressed: handleGetToken),
            RuButton('dio测试', onPressed: handleDio)
          ],
        ),
      ),
    );
  }
}
