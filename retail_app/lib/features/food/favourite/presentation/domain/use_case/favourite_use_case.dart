import 'package:retail_app/features/food/common/model/cafe.dart';
import 'package:retail_app/features/food/home/domain/models/home_test_data.dart';

class FavouriteUseCase {
  FavouriteUseCase();

  final HomeTestData homeTestData = HomeTestData();

  Future<List<Cafe>> getFavourites() async {
    await Future.delayed(const Duration(seconds: 1));
    return homeTestData.favouriteCafesData();
  }
}
