import 'package:flutter/material.dart';
import 'package:retail_app/app/presentation/page/ss_retail_app.dart';

import '../di/service_locator.dart';

launchApp() async {
  WidgetsFlutterBinding.ensureInitialized();

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
