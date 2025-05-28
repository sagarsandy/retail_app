import 'package:flutter/material.dart';
import 'package:retail_admin/app/presentation/page/ss_retail_admin_app.dart';

import '../di/service_locator.dart';

launchApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await registerServices();
  _runApp();
}

void _runApp() {
  runApp(
    const SSRetailAdminApp(
      key: ValueKey('ra_retail_admin_app'),
    ),
  );
}
