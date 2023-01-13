import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tablet/components/button.dart';
import 'package:tablet/components/toast.dart';
import 'package:tablet/apis/user.dart';
import 'package:tablet/utils/global.dart';

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
    final email = Global.prefs.getString('user_email');
    final pwd = Global.prefs.getString('user_password');
    setState(() {
      _email = email ?? '';
      _password = pwd ?? '';
    });
  }

  void _saveUserInfo() {
    final prefs = Global.prefs;
    if (_isRemember) {
      prefs.setString('user_email', _email);
      prefs.setString('user_password', _password);
    } else {
      prefs.remove('user_email');
      prefs.remove('user_password');
    }
  }

  void _handleSubmit() async {
    setState(() => _loading = true);
    try {
      final res = await UserApi.login(email: _email, password: _password);
      _saveUserInfo();
      widget.onSuccess(res);
    } on DioError catch (e) {
      if (e.response != null) {
        Toast.errorBar(e.message);
      }
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: const Key('login_email_input'),
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
          key: const Key('login_password_input'),
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
        CheckboxListTile(
          value: _isRemember,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text(
            'Remember Me',
            style: TextStyle(fontSize: 16),
          ),
          contentPadding: const EdgeInsets.all(0),
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
