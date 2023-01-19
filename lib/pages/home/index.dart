import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/store/user.controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController uc = Get.find<UserController>();

  @override
  void initState() {
    print('get find -- ${uc.user}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFB800),
      ),
      body: Padding(
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
                    ElevatedButton(
                      child: const Text('icons demo'),
                      onPressed: () => Get.toNamed(AppRoutes.icons),
                    ),
                    ElevatedButton(
                      child: const Text('button demo'),
                      onPressed: () => Get.toNamed(AppRoutes.button),
                    ),
                    ElevatedButton(
                      child: const Text('switch brand'),
                      onPressed: () =>
                          Get.offAllNamed(AppRoutes.chooseRestaurant),
                    ),
                    ElevatedButton(
                      child: const Text('test widget'),
                      onPressed: () => Get.toNamed(AppRoutes.test),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
