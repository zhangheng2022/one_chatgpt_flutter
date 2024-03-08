import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  bool _showObscureText = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: (Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail_outlined),
              labelText: '邮箱',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              return '请输入正确的邮箱地址';
            },
            onSaved: (val) {},
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: _showObscureText,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outlined),
              labelText: '密码',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    _showObscureText = !_showObscureText;
                  });
                },
              ),
            ),
            validator: (value) {
              return '请输入正确的邮箱地址';
            },
            onSaved: (val) {},
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton.icon(
              icon: const Icon(Icons.login),
              label: const Text("登录"),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          )
        ],
      )),
    );
  }
}