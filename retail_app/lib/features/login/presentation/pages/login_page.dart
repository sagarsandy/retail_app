import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/presentation/pages/ss_base_widget.dart';
import 'package:retail_app/features/login/service/post_login_service.dart';

import '../../../../app/router/ss_app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SSBaseWidget(title: "Login Page", page: const LoginPageBody());
  }
}

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final PostLoginService postLoginService = PostLoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Center(
          child: GestureDetector(
            onTap: () {
              debugPrint('Login Page Body tapped');
              postLoginService.postLogin();
              context.pushToPage(SSAppRoutes.foodHome);
            },
            child: Container(
                color: Colors.cyan,
                width: 100,
                height: 100,
                child: const Text(
                  'Login Page Body',
                  style: TextStyle(fontSize: 24),
                )),
          ),
        ),
      ),
    );
  }
}
