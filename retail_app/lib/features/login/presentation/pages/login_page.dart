import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Login Page Body tapped');
        postLoginService.postLogin();
        context.pushToPage(SSAppRoutes.foodHome);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: const Center(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
