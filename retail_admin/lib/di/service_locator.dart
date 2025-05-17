import 'package:get_it/get_it.dart';
import 'package:retail_admin/di/service_manager_locator.dart';
import 'package:retail_admin/di/use_case_locator.dart';

import 'cubit_locator.dart';

GetIt locator = GetIt.instance;

Future<void> registerServices() async {
  await registerServiceManagers();
  await registerUseCases();
  await registerCubits();
}
