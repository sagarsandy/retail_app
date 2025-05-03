import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:retail_app/app/presentation/page/ss_retail_app.dart';

import '../di/service_locator.dart';

launchApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await registerServices();
  _runApp();
}

void _runApp() {
  runApp(
    const SSRetailApp(
      key: ValueKey('ra_retail_app'),
    ),
  );
}
