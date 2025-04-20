import 'package:retail_app/features/food/cafe_details/domain/models/cafe_details.dart';
import 'package:retail_app/features/food/cafe_details/domain/models/cafe_test_data.dart';

class CafeDetailsUseCase {
  final CafeTestData cafeTestData = CafeTestData();

  Future<CafeDetails> fetchCafeDetails({
    required String cafeId,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    return cafeTestData.cafeDetailsData();
  }

  CafeDetails filterCafeDetails({
    required CafeDetails cafe,
    bool? isVeg,
    bool? isNonVeg,
    bool? isEgg,
  }) {
    return CafeDetails(
      id: cafe.id,
      name: cafe.name,
      address: cafe.address,
      deliveryTime: cafe.deliveryTime,
      openTime: cafe.openTime,
      closeTime: cafe.closeTime,
      isAvailableNow: cafe.isAvailableNow,
      phoneNumber: cafe.phoneNumber,
      rating: cafe.rating,
      cafeCoupons: cafe.cafeCoupons,
      cafeItemCategories: cafe.cafeItemCategories?.map((category) {
        // Filter items in each category based on flags
        final filteredItems = category.cafeItems?.where((item) {
          final matchVeg = isVeg == null || item.isVeg == isVeg;
          return matchVeg;
        }).toList();

        return CafeItemCategory(
          name: category.name,
          cafeItems: filteredItems,
        );
      }).toList(),
    );
  }

  Future<CafeDetails> filterCafeItems({
    required CafeDetails cafeDetails,
    required List<String> selectedFilters,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    if (cafeDetails.cafeItemCategories == null ||
        cafeDetails.cafeItemCategories!.isEmpty) {
      return cafeDetails;
    }

    return cafeTestData.cafeDetailsData();
  }
}
