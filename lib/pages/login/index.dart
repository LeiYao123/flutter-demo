import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/components/toast.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/utils/storage.dart';
import './components/phone/index.dart';
import './components/email/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String currMode = 'email';

  void handleSuccess(res) {
    final String msg = res['message'];
    final String token = res['data']?['access_token'];

    LocalToken.setToken(token);
    Toast.successBar(msg).then((value) {
      Get.offNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RuColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // stretch 交叉轴铺满解决 Column 交叉轴默认为其本身大小,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/image/rushable-full.png', height: 60),
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
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RadioListTile(
                            title: const Text(
                              'Your Cellphone',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 'phone',
                            groupValue: currMode,
                            onChanged: (v) => setState(() {
                                  currMode = v!;
                                })),
                      ),
                      Expanded(
                        child: RadioListTile(
                            title: const Text(
                              'Your Email',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: 'email',
                            groupValue: currMode,
                            onChanged: (v) => setState(() {
                                  currMode = v!;
                                })),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  currMode == 'phone'
                      ? PhoneForm(onSuccess: handleSuccess)
                      : EmailForm(onSuccess: handleSuccess),
                  const SizedBox(height: 28),
                  const Text('Login issue? Call (855)979-8860'),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
