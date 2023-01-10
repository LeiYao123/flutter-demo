import 'package:flutter/material.dart';
import 'package:tablet/components/button.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  String email = '';
  String password = '';

  void handleSubmit() {
    print('email---$email, $password');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          key: const Key('login_email_input'),
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          onChanged: (v) {
            setState(() {
              email = v;
            });
          },
        ),
        const SizedBox(height: 16),
        TextField(
          key: const Key('login_password_input'),
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          onChanged: (v) {
            setState(() {
              password = v;
            });
          },
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 16, bottom: 8),
          child: RuButton(
            'Sign in',
            onPressed: handleSubmit,
          ),
        ),
      ],
    );
  }
}
