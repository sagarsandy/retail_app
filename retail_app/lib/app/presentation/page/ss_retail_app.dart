import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_app_router.dart';
import 'package:retail_app/app/service/ss_post_app_launch.dart';

import '../../theme/ss_colors.dart';

class SSRetailApp extends StatefulWidget {
  const SSRetailApp({super.key});

  @override
  State<SSRetailApp> createState() => _SSRetailAppState();
}

class _SSRetailAppState extends State<SSRetailApp> {
  final SSPostAppLaunch _postAppLaunch = SSPostAppLaunch();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _postAppLaunch.execute();
    });
    super.initState();
  }

  final router = SSAppRouter().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Retail App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: SSColors.black2),
          titleTextStyle: TextStyle(
            color: SSColors.black2,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
