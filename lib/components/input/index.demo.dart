import 'package:flutter/material.dart';
import 'package:tablet/components/button/index.dart';

import 'index.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

// 保存深入框填写的数据可以利用 onChanged 或者是 onSaved
class _InputDemoState extends State<InputDemo> {
  final _formKey = GlobalKey<FormState>();
  bool _showErr = false;
  String _email = '';
  String _errorinput = '';
  String _pwd = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('input demo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                RInput(
                  labelText: 'Email',
                  prefixIcon: RInput.dollerIcon,
                  suffixIcon: RInput.percentIcon,
                  maxLength: 20,
                  autofocus: true,
                  // readOnly: true,
                  textAlign: TextAlign.end,
                  initialValue: '123@qq.com',
                  onSaved: (v) {
                    _email = v!;
                  },
                ),
                const SizedBox(height: 16),
                const RInput(labelText: 'Disabled Input', disabled: true),
                const SizedBox(height: 16),
                RInput(
                  labelText: 'Error Input',
                  errorText: _showErr ? '错误提示' : null,
                  hintText: 'placehoder 提示',
                  onChanged: (v) {
                    print('onChanged ==> $v');
                    setState(() => _showErr = false);
                  },
                  onSaved: (v) {
                    _errorinput = v!;
                  },
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                RInput(
                  labelText: 'Password',
                  obscureText: true,
                  onSaved: (v) {
                    _pwd = v!;
                  },
                ),
                const SizedBox(height: 16),
                RButton(
                  'Submit',
                  isBlock: true,
                  onPressed: () {
                    _formKey.currentState?.validate();
                    _formKey.currentState?.save();
                    print('表单数据=> $_email, $_errorinput, $_pwd');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


                // TextFormField(
                //   obscureText: true,
                //   decoration: const InputDecoration(
                //     labelText: 'Password',
                //     border: OutlineInputBorder(),
                //   ),
                //   // initialValue: _password,
                //   onChanged: (v) {
                //     print('password $v');
                //   },
                // ),