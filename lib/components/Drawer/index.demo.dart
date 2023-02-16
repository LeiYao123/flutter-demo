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
      key: RuDrawer.drawerScaffoldKey,

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
            RuButton(
              'open end drawer1',
              onPressed: () {
                RuDrawer.openEndDrawer();
                setState(() {
                  _mode = 1;
                });
              },
            ),
            RuButton(
              'open end drawer2',
              margin: const EdgeInsets.symmetric(horizontal: 24),
              onPressed: () {
                RuDrawer.openEndDrawer();
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

  RuDrawer _getDrawer1() {
    return RuDrawer(
      title: const RuText('Draw - 1 - Title', size: 20, isBold: true),
      footer: Row(children: [
        RuButton(
          'Back',
          bgColor: RuColor.common_4,
          fgColor: RuColor.blackPure,
          width: 120,
          onPressed: () => RuDrawer.closeEndDrawer(),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: RuButton(
            'button',
            onPressed: () {},
          ),
        )
      ]),
      child: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            RuButton(
              'close drawer',
              onPressed: () {
                RuDrawer.closeEndDrawer();
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

  RuDrawer _getDrawer2() {
    return RuDrawer(
      title: const RuText('Draw - 2 - Title', size: 20, isBold: true),
      child: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            RuButton(
              'close drawer 2',
              onPressed: () {
                RuDrawer.closeEndDrawer();
              },
            )
          ],
        ),
      ),
    );
  }
}
