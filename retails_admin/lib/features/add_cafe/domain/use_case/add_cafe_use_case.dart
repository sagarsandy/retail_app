import '../models/cafe_data.dart';
import '../repo/add_cafe_repo.dart';

class AddCafeUseCase {
  final AddCafeRepo _addCafeRepo;

  AddCafeUseCase(this._addCafeRepo);

  Future<void> addCafe(CafeData cafeData) async {
    // Basic validation can be added here later if needed
    return _addCafeRepo.addCafe(cafeData);
  }
}
