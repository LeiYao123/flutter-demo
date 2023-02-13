import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/store/user.controller.dart';

class ComponentsDemo extends StatefulWidget {
  const ComponentsDemo({super.key});

  @override
  State<ComponentsDemo> createState() => _HomePageState();
}

class _HomePageState extends State<ComponentsDemo> {
  final UserController uc = Get.find<UserController>();
  int _pageIndex = 0;

  @override
  void initState() {
    print('get find -- ${uc.user}');
    super.initState();
  }

  final List<Widget> _pageView = [
    const MyHome(),
    const Text('second'),
    const Text('Third')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavigationRail(
              groupAlignment: -1.0,
              selectedIndex: _pageIndex,
              leading: const Icon(Icons.menu),
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  label: Text('first'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  label: Text('second'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  label: Text('Third'),
                ),
              ],
            ),
            Expanded(child: _pageView[_pageIndex])
          ],
        ),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<UserController>(
                builder: (co) => Text(
                    '${co.user['email']} \n ${co.user['id']} \n ${co.user['phone']}'),
              ),
              const Divider(),
              Wrap(
                spacing: 12,
                children: [
                  ElevatedButton(
                    child: const Text('login page'),
                    onPressed: () => Get.offNamed(AppRoutes.login),
                  ),
                  // ElevatedButton(
                  //   child: const Text('icons demo'),
                  //   onPressed: () => Get.toNamed(AppRoutes.icons),
                  // ),
                  // ElevatedButton(
                  //   child: const Text('button demo'),
                  //   onPressed: () => Get.toNamed(AppRoutes.button),
                  // ),
                  // ElevatedButton(
                  //   child: const Text('switch brand'),
                  //   onPressed: () =>
                  //       Get.offAllNamed(AppRoutes.chooseRestaurant),
                  // ),
                  // ElevatedButton(
                  //   child: const Text('test widget'),
                  //   onPressed: () => Get.toNamed(AppRoutes.test),
                  // ),
                  // ElevatedButton(
                  //   child: const Text('sliver page SNH48'),
                  //   onPressed: () => Get.toNamed(AppRoutes.sliver),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
