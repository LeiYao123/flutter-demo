import 'package:get/get.dart';
import 'package:tablet/pages/orders/index.dart';
import 'package:tablet/pages/choose_restaurant/index.dart';
import 'package:tablet/pages/landing_page/index.dart';
import 'package:tablet/pages/login/index.dart';
import 'package:tablet/pages/components_demo/index.dart';

class AppRoutes {
  static String landing = '/';
  static String order = '/order';
  static String login = '/login';
  static String chooseRestaurant = '/choose-restaurant';
  // =====demo 示例页面======
  static String componentsDemo = '/components-demo';

  static final List<GetPage> getRoutes = [
    GetPage(name: landing, page: () => const LandingPage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: chooseRestaurant, page: () => const ChooseRestaurant()),
    GetPage(name: order, page: () => const OrdersPage()),
    // =====demo 示例页面======
    GetPage(name: componentsDemo, page: () => const ComponentsDemo())
  ];
}
