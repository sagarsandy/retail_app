import 'package:retail_app/features/food/common/model/cafe.dart';
import 'package:retail_app/features/food/home/domain/models/home_test_data.dart';

class RecommendedCafeUseCase {
  final HomeTestData homeTestData = HomeTestData();

  Future<List<Cafe>> getRecommendedCafes() async {
    await Future.delayed(const Duration(seconds: 2));
    return homeTestData.cafeData();
  }
}
