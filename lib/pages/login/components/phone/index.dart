import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tablet/apis/user.dart';
import 'package:tablet/components/button.dart';
import 'package:tablet/components/text.dart';
import 'package:tablet/components/toast.dart';
import 'package:tablet/style/color.dart';

class PhoneForm extends StatefulWidget {
  final void Function(Map<String, dynamic> res) onSuccess;
  const PhoneForm({super.key, required this.onSuccess});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  bool _isLoading = false;
  String _currMode = 'phone'; // phone、code
  String _phoneNumber = '';
  String _code = '';
  // 获取验证码
  void _handleGetCode() async {
    setState(() => _isLoading = true);
    try {
      final res = await UserApi.sendCode(phone: _phoneNumber);
      Toast.successBar(res['message']);
      setState(() {
        _currMode = 'code';
      });
    } on DioError catch (e) {
      if (e.response != null) Toast.errorBar(e.message);
    }
    setState(() => _isLoading = false);
  }

  // 登录
  void _handleLogin() async {
    setState(() => _isLoading = true);
    try {
      final res = await UserApi.login(phone: _phoneNumber, code: _code);
      widget.onSuccess(res);
      setState(() {
        _currMode = 'code';
      });
    } on DioError catch (e) {
      if (e.response != null) Toast.errorBar(e.message);
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    String btnTxt = _currMode == 'phone' ? 'Send code' : 'Sign in';
    dynamic Function() onSubmit =
        _currMode == 'phone' ? _handleGetCode : _handleLogin;

    return Column(
      children: [
        _currMode == 'phone'
            ? TextFormField(
                key: const Key('login_phone_input'),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
                initialValue: _phoneNumber,
                onChanged: (v) {
                  setState(() => _phoneNumber = v);
                },
              )
            : TextFormField(
                key: const Key('login_code_input'),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Verification code',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  setState(() => _code = v);
                },
              ),
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 8),
          child: RuButton(
            btnTxt,
            loading: _isLoading,
            isBlock: true,
            onPressed: onSubmit,
          ),
        ),
        _currMode != 'phone'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: RuText('Go Back', color: RuColor.yellow),
                    onTap: () {
                      setState(() {
                        _currMode = 'phone';
                        _code = '';
                      });
                    },
                  ),
                  const RuText(' | '),
                  InkWell(
                    onTap: _handleGetCode,
                    child: RuText('Go Back', color: RuColor.yellow),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
