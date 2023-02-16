import 'package:flutter/material.dart';

class RuDrawer extends StatelessWidget {
  final Widget child;
  final double? width;
  final Widget? title;
  final Widget? footer;
  const RuDrawer({
    super.key,
    required this.child,
    this.width = 536,
    this.title,
    this.footer,
  });

  static final GlobalKey<ScaffoldState> drawerScaffoldKey =
      GlobalKey<ScaffoldState>();

  static openDrawer() {
    drawerScaffoldKey.currentState!.openDrawer();
  }

  static openEndDrawer() {
    drawerScaffoldKey.currentState!.openEndDrawer();
  }

  static closeEndDrawer() {
    drawerScaffoldKey.currentState!.closeEndDrawer();
  }

  static closeDrawer() {
    drawerScaffoldKey.currentState!.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null)
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 24),
                child: title,
              ),
            Expanded(child: SingleChildScrollView(child: child)),
            if (footer != null)
              Padding(padding: const EdgeInsets.only(top: 32), child: footer)
          ],
        ),
      ),
    );
  }
}


//  阻止点击遮罩层隐藏 drawer 示例
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent, // 重点
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [Drawer(child: Text('drawer')),],
//       ),
//     );
//   }
