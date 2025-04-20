import '../models/cafe_details.dart';

abstract class CafeDetailsRepo {
  Future<CafeDetails> fetchCafeDetails({
    required String cafeId,
  });
}
