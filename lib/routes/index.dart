import 'package:get/get.dart';
import 'package:tablet/pages/Orders/index.dart';
import 'package:tablet/pages/chooseRestaurant/index.dart';
import 'package:tablet/pages/landingPage/index.dart';
import 'package:tablet/pages/Home/index.dart';
import 'package:tablet/pages/login/index.dart';
import 'package:tablet/pages/otherPage/index.dart';
import 'package:tablet/pages/iconsDemoPage/index.dart';
import 'package:tablet/pages/buttonDemoPage/index.dart';
import 'package:tablet/pages/testPage/index.dart';

class AppRoutes {
  static String landing = '/';
  static String order = '/order';
  static String login = '/login';
  static String chooseRestaurant = '/choose-restaurant';
  // =====以下为测试页面======
  static String home = '/home';
  static String other = '/other';
  static String icons = '/icons';
  static String button = '/button';
  static String test = '/test';

  static final List<GetPage> getRoutes = [
    GetPage(name: landing, page: () => const LandingPage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: chooseRestaurant, page: () => const ChooseRestaurant()),
    GetPage(name: order, page: () => const OrdersPage()),

    // // =====以下为测试页面======
    GetPage(name: order, page: () => const HomePage()),
    GetPage(name: other, page: () => Other()),
    GetPage(name: icons, page: () => const IconsPage()),
    GetPage(name: button, page: () => const ButtonPage()),
    GetPage(name: test, page: () => const TestPage()),
  ];
}
