import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tablet/apis/brand.dart';
import 'package:tablet/components/toast.dart';
import 'package:tablet/style/image.dart';

class ChooseRestaurant extends StatefulWidget {
  const ChooseRestaurant({super.key});

  @override
  State<ChooseRestaurant> createState() => _ChooseRestaurantState();
}

class _ChooseRestaurantState extends State<ChooseRestaurant> {
  @override
  void initState() {
    super.initState();

    getBrands();
  }

  void getBrands() async {
    try {
      final res = await BrandApi.getBrands();
      print('res==>$res');
    } on DioError catch (e) {
      Toast.errorBar(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('choose restaurant')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.02,
            image: AssetImage(ImagePath.loginBg),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: const Text('已登录状态，token 已存储， 选择brand location 页面'),
      ),
    );
  }
}
