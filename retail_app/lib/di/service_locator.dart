import 'package:get_it/get_it.dart';
import 'package:retail_app/di/cubit_locator.dart';
import 'package:retail_app/di/service_manager_locator.dart';
import 'package:retail_app/di/use_case_locator.dart';

GetIt locator = GetIt.instance;

Future<void> registerServices() async {
  await registerServiceManagers();
  await registerUseCases();
  await registerCubits();
}
