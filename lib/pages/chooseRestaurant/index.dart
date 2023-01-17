import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:tablet/apis/brand.dart';
import 'package:tablet/components/text.dart';
import 'package:tablet/components/toast.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/style/image.dart';

class ChooseRestaurant extends StatefulWidget {
  const ChooseRestaurant({super.key});

  @override
  State<ChooseRestaurant> createState() => _ChooseRestaurantState();
}

class _ChooseRestaurantState extends State<ChooseRestaurant> {
  int _step = 1; // 1: 选择 brand 2: 选择 location
  List _brandList = [];
  final RefreshController _pullRefresher =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getBrands();
    if (Get.arguments != null) {
      Future.delayed(Duration.zero)
          .then((value) => {Toast.successBar(Get.arguments)});
    }
  }

  void getBrands({bool isRefresh = false}) async {
    try {
      final res = await BrandApi.getBrands();
      setState(() {
        _brandList = res['data'] ?? [];
      });
    } on DioError catch (e) {
      Toast.errorBar(e.message);
    } finally {
      if (isRefresh) {
        _pullRefresher.refreshCompleted();
      }
    }
  }

  void _handleBack() {
    if (_step == 1) {
      print('logout 操作');
      return;
    }
    setState(() {
      _step = 1;
    });
  }

  Widget _getBrandItem(e) {
    return Center(
      child: InkWell(
        child: Container(
          width: 500,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: RuColor.gray),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RuText(e['name'], size: 20, isBold: true),
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                alignment: Alignment.center,
                child: RuText(e['locations_count']),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RuText(
          'Select Your ${_step == 1 ? 'Brand' : 'Store'}',
          isBold: true,
        ),
        leadingWidth: 300,
        leading: GestureDetector(
          onTap: _handleBack,
          child: Row(
            children: [
              const SizedBox(width: 16),
              const Icon(Icons.arrow_back_ios),
              RuText(_step == 1 ? 'LOG OUT' : 'GO BACK', isBold: true),
            ],
          ),
        ),
      ),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SmartRefresher(
              controller: _pullRefresher,
              header: const ClassicHeader(),
              onRefresh: () => getBrands(isRefresh: true),
              child: ListView(
                children: _brandList.map((e) => _getBrandItem(e)).toList(),
              ),
            ),
          )),
    );
  }
}
