import 'package:retail_admin/di/service_locator.dart';

import '../app/router/ss_app_router.dart';

Future<void> registerServiceManagers() async {
  _registerAppRouter();
}

void _registerAppRouter() {
  locator.registerLazySingleton<SSAppRouter>(() => SSAppRouter());
}
