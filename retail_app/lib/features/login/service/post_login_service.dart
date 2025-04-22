import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/favourite/presentation/cubit/favourite_cubit.dart';

class PostLoginService {
  Future<void> postLogin() async {
    _handleFavourites();
  }

  void _handleFavourites() {
    final FavouriteCubit favouriteCubit = locator<FavouriteCubit>();
    favouriteCubit.getFavourites();
  }
}
