import 'package:flutter/material.dart';
import 'package:retail_app/app/presentation/page/ss_retail_app.dart';

launchApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  _runApp();
}

void _runApp() {
  runApp(
    const SSRetailApp(
      key: ValueKey('ra_retail_app'),
    ),
  );
}
