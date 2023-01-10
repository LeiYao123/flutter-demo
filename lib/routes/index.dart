import 'package:get/get.dart';
import 'package:tablet/pages/home/index.dart';
import 'package:tablet/pages/login/index.dart';
import 'package:tablet/pages/other/index.dart';
import 'package:tablet/pages/icons/index.dart';
import 'package:tablet/pages/button/index.dart';
import 'package:tablet/pages/test/index.dart';

var appRoutes = [
  GetPage(name: '/', page: () => const Home()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/other', page: () => Other()),
  GetPage(name: '/icons', page: () => const IconsPage()),
  GetPage(name: '/button', page: () => const ButtonPage()),
  GetPage(name: '/test', page: () => const TestPage()),
];
