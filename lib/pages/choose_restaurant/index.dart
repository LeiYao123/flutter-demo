import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:tablet/apis/brand.dart';
import 'package:tablet/apis/user.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/components/toast/index.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/style/image.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/utils/storage.dart';

class ChooseRestaurant extends StatefulWidget {
  const ChooseRestaurant({super.key});

  @override
  State<ChooseRestaurant> createState() => _ChooseRestaurantState();
}

class _ChooseRestaurantState extends State<ChooseRestaurant> {
  int _step = 1; // 1: 选择 brand 2: 选择 location
  List _brandList = [];
  List _locationList = [];
  late String _currBrandId;
  final RefreshController _pullRefresher =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _getBrandsApi();
    if (Get.arguments != null) {
      Future.delayed(Duration.zero)
          .then((value) => {Toast.successBar(Get.arguments)});
    }
  }

  void _getBrandsApi({bool isRefresh = false}) async {
    try {
      final res = await BrandApi.getBrands();
      final data = res['data'] ?? [];
      List list = data.map((e) {
        return {
          'id': e['id'].toString(),
          'name': e['name'],
          'desc': e['locations_count'],
          'checked': false,
        };
      }).toList();
      setState(() {
        _brandList = list;
      });
    } on DioError catch (e) {
      Toast.errorBar(e.message!);
    } finally {
      if (isRefresh) {
        _pullRefresher.refreshCompleted();
      }
    }
  }

  void _getLocationsApi(String brandId, {bool isRefresh = false}) async {
    try {
      final res = await BrandApi.getLocations(brandId);
      final data = res?['data']['data'] ?? [];
      List list = data.map((e) {
        String line1 = e?['address']?['line_1'] ?? '';
        String line2 = e?['address']?['line_2'] ?? '';
        return {
          'id': e['id'].toString(),
          'name': e?['name'] ?? '',
          'address': '$line1 $line2',
          'desc': e?['address']?['state'] ?? '',
          'checked': false,
        };
      }).toList();
      setState(() {
        _locationList = list;
      });
    } on DioError catch (e) {
      Toast.errorBar(e.message!);
    } finally {
      if (isRefresh) {
        _pullRefresher.refreshCompleted();
      } else {
        _cancelChecked();
        _step = 2;
      }
    }
  }

  void _getProfileApi(String locationId) async {
    try {
      await UserApi.getProfile(_currBrandId);
      await Global.prefs.setString(StorageKey.brandId, _currBrandId);
      await Global.prefs.setString(StorageKey.locationId, locationId);
      _cancelChecked();
      // Get.offAllNamed(AppRoutes.home);
      // 跳到首页
    } catch (e) {
      print('request profile => $e');
    }
  }

  // 返回操作
  void _handleBack() {
    if (_step == 1) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      setState(() {
        _step = 1;
      });
    }
  }

  // 取消高亮选中效果
  void _cancelChecked() {
    List brands = _brandList.map((e) => ({...e, 'checked': false})).toList();
    List locations =
        _locationList.map((e) => ({...e, 'checked': false})).toList();
    setState(() {
      _brandList = brands;
      _locationList = locations;
    });
  }

  // 点击brand
  void _handleTapBrandItem(e) {
    _currBrandId = e['id'];
    _getLocationsApi(_currBrandId);

    List list = _brandList.map((v) {
      v['id'] == e['id'] ? v['checked'] = true : v['checked'] = false;
      return v;
    }).toList();
    setState(() {
      _brandList = list;
    });
  }

  void _handleTapLocationItem(e) {
    _getProfileApi(e['id']);
    List list = _locationList.map((v) {
      v['id'] == e['id'] ? v['checked'] = true : v['checked'] = false;
      return v;
    }).toList();
    setState(() {
      _locationList = list;
    });
  }

  List<Widget> _getItem(List list) {
    return list.map((e) {
      bool checked = e['checked'];
      return Center(
        child: GestureDetector(
          onTap: () =>
              _step == 1 ? _handleTapBrandItem(e) : _handleTapLocationItem(e),
          child: Container(
            width: 500,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                width: checked ? 2 : 1,
                color: checked ? RColor.yellow : RColor.light_bg_absolute,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _step == 1
                    ? RText(e['name'], size: 20)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RText(e['name'], size: 20),
                          const SizedBox(height: 8),
                          RText(e['address'], size: 12, color: Colors.black26),
                        ],
                      ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: checked
                        ? null
                        : const Color.fromARGB(31, 140, 139, 139),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  alignment: Alignment.center,
                  child: checked
                      ? const CircularProgressIndicator()
                      : RText(e['desc'], size: 14),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RText('Select Your ${_step == 1 ? 'Brand' : 'Store'}',
            weight: FontWeight.w700),
        centerTitle: true,
        leadingWidth: 300,
        leading: GestureDetector(
          onTap: _handleBack,
          child: Row(
            children: [
              const SizedBox(width: 16),
              const Icon(Icons.arrow_back),
              RText(_step == 1 ? 'LOG OUT' : 'GO BACK'),
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
            onRefresh: () => _step == 1
                ? _getBrandsApi(isRefresh: true)
                : _getLocationsApi(_currBrandId, isRefresh: true),
            child: ListView(
              children:
                  _step == 1 ? _getItem(_brandList) : _getItem(_locationList),
            ),
          ),
        ),
      ),
    );
  }
}
