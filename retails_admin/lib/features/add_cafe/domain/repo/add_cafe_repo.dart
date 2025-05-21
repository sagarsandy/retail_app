import '../models/cafe_data.dart';

abstract class AddCafeRepo {
  Future<void> addCafe(CafeData cafeData);
}
