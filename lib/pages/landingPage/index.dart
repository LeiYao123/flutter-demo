import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/apis/user.dart';
import 'package:tablet/components/button.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/utils/storage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String _error = '';
  @override
  void initState() {
    super.initState();
    _getLoginStatus();
  }

  void _getLoginStatus() async {
    await Future.delayed(Duration.zero);
    try {
      final token = Global.prefs.getString(StorageKey.token);
      final brandId = Global.prefs.getString(StorageKey.brandId);
      final locationId = Global.prefs.getString(StorageKey.locationId);
      print('brandid - $brandId - $locationId');
      if (token != null) {
        if (brandId == null || locationId == null) {
          Get.offNamed(AppRoutes.chooseRestaurant);
        } else {
          try {
            print(brandId is String);
            await UserApi.getProfile(brandId);
            // Get.offNamed(AppRoutes.home);
          } on DioError catch (e) {
            // print(e);
            setState(() {
              _error = e.message;
            });
          }
        }
      } else {
        Get.offNamed(AppRoutes.login);
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _error.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Error: $_error"),
                  const SizedBox(height: 20),
                  RuButton('Try again', onPressed: () {
                    _getLoginStatus();
                    setState(() {
                      _error = '';
                    });
                  }),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
