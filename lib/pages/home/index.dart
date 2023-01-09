import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './index.controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 Get.put 实例化你的类，使其对当下的所有子路由可用
    final HomeController c = Get.put(HomeController());
    return Scaffold(
      // 使用 Obx 每当改变计数时就更新 text
      appBar: AppBar(
        title: const Text('GetX demo'),
        backgroundColor: const Color(0xFFFFB800),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(() => Text('Obx 控制clicks: ${c.count}')),
          GetX<HomeController>(builder: (co) {
            return Text('GetX 控制 ${co.count}');
          }),
          GetBuilder<HomeController>(builder: (co) {
            return Text('GetBuilder 控制 ${co.count}');
          }),
          ElevatedButton(
              onPressed: () {
                c.sub();
              },
              child: const Text('GetBuilder 操作')),
          ElevatedButton(
            child: const Text('go to other'),
            // 只需简单的 Get.to 即可跳转路由
            onPressed: () =>
                Get.toNamed('/other', arguments: {'title': '路由传参'}),
          ),
          ElevatedButton(
            child: const Text('go to icons'),
            // 只需简单的 Get.to 即可跳转路由
            onPressed: () => Get.toNamed('/icons'),
          ),
          ElevatedButton(
            child: const Text('go to button'),
            // 只需简单的 Get.to 即可跳转路由
            onPressed: () => Get.toNamed('/button'),
          ),
          ElevatedButton(
              onPressed: () {
                Get.snackbar('I am snackbar', 'i am message');
              },
              child: const Text('snackbar')),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog();
              },
              child: const Text('default dialog')),
          ElevatedButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  width: 300,
                  height: 300,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: const Text('data'),
                ));
              },
              child: const Text('bottomSheet'))
        ],
      )),
      floatingActionButton:
          FloatingActionButton(onPressed: c.add, child: const Icon(Icons.add)),
    );
  }
}
