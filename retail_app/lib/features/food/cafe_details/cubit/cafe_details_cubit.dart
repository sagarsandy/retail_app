import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/features/food/cafe_details/domain/use_case/cafe_details_use_case.dart';

import '../domain/models/cafe_details.dart';
import 'cafe_details_state.dart';

class CafeDetailsCubit extends Cubit<CafeDetailsState> {
  final CafeDetailsUseCase _cafeDetailsUseCase;

  CafeDetailsCubit(this._cafeDetailsUseCase) : super(CafeDetailsInitialState());

  CafeDetails? cafeDetails;

  Future<void> fetchCafeDetails(String cafeId) async {
    emit(CafeDetailsLoadingState());
    try {
      final cafeData =
          await _cafeDetailsUseCase.fetchCafeDetails(cafeId: cafeId);
      cafeDetails = cafeData;
      emit(CafeDetailsLoadedState(cafeDetails: cafeData));
    } catch (e) {
      emit(CafeDetailsErrorState(message: e.toString()));
    }
  }

  Future<void> filterCafeItems(List<String> selectedFilters) async {
    debugPrint("SS Selected filters are $selectedFilters");

    if (cafeDetails == null ||
        cafeDetails?.cafeItemCategories == null ||
        cafeDetails?.cafeItemCategories?.isEmpty == true) {
      return;
    }
    emit(CafeDetailsLoadingState());
    if (selectedFilters.isEmpty) {
      emit(CafeDetailsLoadedState(cafeDetails: cafeDetails!));
      return;
    }

    selectedFilters =
        selectedFilters.map((filter) => filter.toLowerCase()).toList();

    try {
      bool isEgg = selectedFilters.contains("egg");
      bool isVeg = selectedFilters.contains("veg");
      bool isNonVeg = selectedFilters.contains("non-veg");
      final CafeDetails filteredCafeDetails =
          _cafeDetailsUseCase.filterCafeDetails(
        cafe: cafeDetails!,
        isVeg: isVeg,
        isNonVeg: isNonVeg,
        isEgg: isEgg,
      );
      emit(CafeDetailsLoadedState(cafeDetails: filteredCafeDetails));
      return;
    } catch (e) {
      emit(CafeDetailsErrorState(message: e.toString()));
      return;
    }
  }
}
