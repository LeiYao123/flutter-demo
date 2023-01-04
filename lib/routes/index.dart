import 'package:get/get.dart';
import 'package:tablet/pages/home/index.dart';
import 'package:tablet/pages/other/index.dart';
import 'package:tablet/pages/icons/index.dart';

var appRoutes = [
  GetPage(name: '/', page: () => const Home()),
  GetPage(name: '/other', page: () => Other()),
  GetPage(name: '/icons', page: () => const IconsPage()),
];
