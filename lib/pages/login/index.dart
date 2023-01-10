import 'package:flutter/material.dart';
import './components/phone/index.dart';
import './components/email/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String currMode = 'email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image/rushable-full.png', height: 60),
          Card(
            elevation: 0,
            margin: const EdgeInsets.only(top: 20),
            child: Container(
              width: 500,
              padding: const EdgeInsets.all(32.0),
              child: Column(children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
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
                currMode == 'phone' ? PhoneForm() : EmailForm(),
                const SizedBox(height: 28),
                const Text('Login issue? Call (855)979-8860'),
              ]),
            ),
          ),
        ],
      ),
    ));
  }
}
