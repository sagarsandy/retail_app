import 'package:flutter/material.dart';
import 'package:retail_admin/app/router/ss_app_router.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../service/ss_post_app_launch.dart';

class SSRetailAdminApp extends StatefulWidget {
  const SSRetailAdminApp({super.key});

  @override
  State<SSRetailAdminApp> createState() => _SSRetailAdminAppState();
}

class _SSRetailAdminAppState extends State<SSRetailAdminApp> {
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
      title: 'Retail Admin App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: SSColors.surface,
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
