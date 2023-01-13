import 'package:get/get.dart';
import 'package:tablet/pages/home/index.dart';
import 'package:tablet/pages/login/index.dart';
import 'package:tablet/pages/other/index.dart';
import 'package:tablet/pages/icons/index.dart';
import 'package:tablet/pages/button/index.dart';
import 'package:tablet/pages/test/index.dart';

class AppRoutes {
  static String home = '/';
  static String login = '/login';
  static String other = '/other';
  static String icons = '/icons';
  static String button = '/button';
  static String test = '/test';

  static final List<GetPage> getRoutes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: other, page: () => Other()),
    GetPage(name: icons, page: () => const IconsPage()),
    GetPage(name: button, page: () => const ButtonPage()),
    GetPage(name: test, page: () => const TestPage()),
  ];
}
