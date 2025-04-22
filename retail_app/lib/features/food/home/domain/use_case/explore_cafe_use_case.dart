import 'dart:async';

import 'package:retail_app/features/food/home/domain/models/home_test_data.dart';

import '../../../common/model/cafe.dart';

class ExploreCafeUseCase {
  final HomeTestData homeTestData = HomeTestData();
  ExploreCafeUseCase();
  Timer? _timer;

  List<Cafe>? cachedCafes = [];
  DateTime? lastFetchedTime;

  resetCache() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 30), () {
      cachedCafes = null;
      _timer = null;
    });
  }

  Future<List<Cafe>> getExploreCafes() async {
    final now = DateTime.now();
    if (cachedCafes != null &&
        lastFetchedTime != null &&
        now.difference(lastFetchedTime!) < const Duration(seconds: 10)) {
      return cachedCafes!;
    }
    lastFetchedTime = now;
    resetCache();
    await Future.delayed(const Duration(seconds: 2));
    cachedCafes = homeTestData.cafeData();
    return cachedCafes ?? [];
  }
}
