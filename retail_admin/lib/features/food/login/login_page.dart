import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Container(
        height: 300,
        width: 300,
        color: Colors.cyan,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_cafe');
            },
            child: const Text('Go to Add Cafe Page'),
          ),
        ),
      ),
    );
  }
}
