import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/components/radio/index.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/style/image.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/utils/storage.dart';
import './components/phone/index.dart';
import './components/email/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _currMode = 'phone';

  // login success 成功之后统一处理
  void handleSuccess(res) async {
    final String msg = res['message'];
    final String token = res['data']?['access_token'];
    await Global.prefs.setString(StorageKey.token, token);
    Get.offNamed(AppRoutes.chooseRestaurant, arguments: msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColor.light_bg_absolute,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch, // stretch 交叉轴铺满解决 将父集的紧约束传递给自身
            children: [
              Image.asset(ImagePath.logo, height: 60),
              Center(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(top: 36),
                  child: Container(
                    width: 500,
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RRadio(
                              label: 'Your Cellphone',
                              value: 'phone',
                              groupValue: _currMode,
                              onChanged: (v) {
                                setState(() {
                                  _currMode = v;
                                });
                              },
                            ),
                            RRadio(
                              label: 'Your Email',
                              value: 'email',
                              groupValue: _currMode,
                              onChanged: (v) {
                                setState(() {
                                  _currMode = v;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        _currMode == 'phone'
                            ? PhoneForm(onSuccess: handleSuccess)
                            : EmailForm(onSuccess: handleSuccess),
                        const SizedBox(height: 28),
                        const RText('Login issue? Call (855)979-8860'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
