import 'package:retail_app/di/service_locator.dart';

import '../features/food/cafe_details/cubit/cafe_details_cubit.dart';
import '../features/food/cart/cubit/cafe_cart_cubit.dart';

Future<void> registerCubits() async {
  _registerCafeDetailsCubit();
  _registerCafeCartCubit();
}

void _registerCafeDetailsCubit() {
  locator.registerFactory<CafeDetailsCubit>(
    () => CafeDetailsCubit(locator.get()),
  );
}

void _registerCafeCartCubit() {
  locator.registerLazySingleton<CafeCartCubit>(
    () => CafeCartCubit(),
  );
}
