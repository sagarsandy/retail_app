import 'package:retail_app/di/service_locator.dart';

import '../features/food/cafe_details/domain/use_case/cafe_details_use_case.dart';

Future<void> registerUseCases() async {
  _registerCafeDetailsUseCase();
}

void _registerCafeDetailsUseCase() {
  locator.registerFactory<CafeDetailsUseCase>(
    () => CafeDetailsUseCase(),
  );
}
