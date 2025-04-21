import 'package:retail_app/features/food/home/domain/models/home_test_data.dart';

import '../../../common/model/cafe.dart';

class ExploreCafeUseCase {
  final HomeTestData homeTestData = HomeTestData();

  ExploreCafeUseCase();

  Future<List<Cafe>> getExploreCafes() async {
    await Future.delayed(const Duration(seconds: 2));
    return homeTestData.cafeData();
  }
}
