import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tablet/components/button/index.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/style/color.dart';
import './index.dart';

class DrawerDemo extends StatefulWidget {
  const DrawerDemo({super.key});

  @override
  State<DrawerDemo> createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  int _mode = 1;
  @override
  Widget build(BuildContext context) {
    // 设置状态栏颜色
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.red, // 设置状态栏颜色
      ),
    );
    return Scaffold(
      key: RDrawer.drawerScaffoldKey,

      appBar: AppBar(
        title: const Text('测试抽屉组件'),
        // 隐藏右上角的菜单图标
        actions: const [SizedBox()],
      ),
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      // drawer: _mode == 1 ? _getDrawer1() : _getDrawer2(),
      endDrawer: _mode == 1 ? _getDrawer1() : _getDrawer2(),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            RButton(
              'open end drawer1',
              onPressed: () {
                RDrawer.openEndDrawer();
                setState(() {
                  _mode = 1;
                });
              },
            ),
            RButton(
              'open end drawer2',
              margin: const EdgeInsets.symmetric(horizontal: 24),
              onPressed: () {
                RDrawer.openEndDrawer();
                setState(() {
                  _mode = 2;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  RDrawer _getDrawer1() {
    return RDrawer(
      title: const RText('Draw - 1 - Title', size: 20, isBold: true),
      footer: Row(children: [
        RButton(
          'Back',
          bgColor: RColor.light_common_4,
          fgColor: RColor.black_pure,
          width: 120,
          onPressed: () => RDrawer.closeEndDrawer(),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: RButton(
            'button',
            onPressed: () {},
          ),
        )
      ]),
      child: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            RButton(
              'close drawer',
              onPressed: () {
                RDrawer.closeEndDrawer();
              },
            ),
            Container(
              height: 300,
              color: Colors.amberAccent,
              child: const Text('测试内部滚动'),
            ),
            Container(
              height: 300,
              color: Colors.blue,
              child: const Text('测试内部滚动'),
            ),
            Container(
              height: 300,
              color: Colors.amberAccent,
              child: const Text('测试内部滚动'),
            )
          ],
        ),
      ),
    );
  }

  RDrawer _getDrawer2() {
    return RDrawer(
      title: const RText('Draw - 2 - Title', size: 20, isBold: true),
      child: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            RButton(
              'close drawer 2',
              onPressed: () {
                RDrawer.closeEndDrawer();
              },
            )
          ],
        ),
      ),
    );
  }
}
