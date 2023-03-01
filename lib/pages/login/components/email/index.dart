import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tablet/components/button/index.dart';
import 'package:tablet/components/checkbox/index.dart';
import 'package:tablet/components/toast/index.dart';
import 'package:tablet/apis/user.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/utils/storage.dart';

class EmailForm extends StatefulWidget {
  final void Function(Map<String, dynamic> res) onSuccess;
  const EmailForm({super.key, required this.onSuccess});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  String _email = '';
  String _password = '';
  bool _isRemember = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    final email = Global.prefs.getString(StorageKey.email);
    final pwd = Global.prefs.getString(StorageKey.password);
    setState(() {
      _email = email ?? '';
      _password = pwd ?? '';
    });
  }

  void _saveUserInfo(res) async {
    final prefs = Global.prefs;
    if (_isRemember) {
      await prefs.setString(StorageKey.email, _email);
      await prefs.setString(StorageKey.password, _password);
    } else {
      await prefs.remove(StorageKey.email);
      await prefs.remove(StorageKey.password);
    }
    widget.onSuccess(res);
  }

  void _handleSubmit() async {
    setState(() => _loading = true);
    try {
      final res = await UserApi.login(email: _email, password: _password);
      _saveUserInfo(res);
    } on DioError catch (e) {
      Toast.errorBar(e.message!);
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          // key: const ValueKey('login_email_input'),
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          initialValue: _email,
          onChanged: (v) {
            setState(() {
              _email = v;
            });
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          // key: const ValueKey('login_password_input'),
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          initialValue: _password,
          onChanged: (v) {
            setState(() {
              _password = v;
            });
          },
        ),
        RuCheckbox(
          value: _isRemember,
          label: 'Remember Me',
          onChanged: (value) {
            setState(() {
              _isRemember = value!;
            });
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 8),
          child: RuButton(
            'Sign in',
            loading: _loading,
            isBlock: true,
            onPressed: _handleSubmit,
          ),
        ),
      ],
    );
  }
}
