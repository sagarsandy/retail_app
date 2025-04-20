import 'package:retail_app/di/service_locator.dart';

import '../features/food/cafe_details/cubit/cafe_details_cubit.dart';

Future<void> registerCubits() async {
  _registerCafeDetailsCubit();
}

void _registerCafeDetailsCubit() {
  locator.registerFactory<CafeDetailsCubit>(
    () => CafeDetailsCubit(locator.get()),
  );
}
