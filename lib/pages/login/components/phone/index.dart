import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tablet/components/button.dart';
import 'package:tablet/style/color.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({super.key});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  bool isLoading = false;
  String currMode = 'phone'; // phone、code
  String phoneNumber = '';
  String code = '';

  void handleGetCode() {
    setState(() {
      isLoading = true;
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        currMode = 'code';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        currMode == 'phone'
            ? TextField(
                key: const Key('login_phone_input'),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  setState(() {
                    phoneNumber = v;
                  });
                },
              )
            : TextField(
                key: const Key('login_code_input'),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Verification code',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  setState(() {
                    phoneNumber = v;
                  });
                },
              ),
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 8),
          child: RuButton(
            currMode == 'phone' ? 'Send code' : 'Sign in',
            loading: isLoading,
            isBlock: true,
            onPressed: handleGetCode,
          ),
        ),
        currMode != 'phone'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text('Go Back',
                        style: TextStyle(color: RuColor.yellow)),
                    onTap: () {
                      setState(() {
                        currMode = 'phone';
                        code = '';
                      });
                    },
                  ),
                  const Text(' | '),
                  InkWell(
                    onTap: handleGetCode,
                    child: Text('Resend Code',
                        style: TextStyle(color: RuColor.yellow)),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
