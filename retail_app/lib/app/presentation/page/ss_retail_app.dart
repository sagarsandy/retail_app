import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_app_router.dart';
import 'package:retail_app/app/service/ss_post_app_launch.dart';

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
        primarySwatch: Colors.orange,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
