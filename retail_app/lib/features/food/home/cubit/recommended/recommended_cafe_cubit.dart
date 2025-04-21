import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/features/food/home/cubit/recommended/recommended_cafe_state.dart';
import 'package:retail_app/features/food/home/domain/use_case/recommended_cafe_use_case.dart';

class RecommendedCafeCubit extends Cubit<RecommendedCafeState> {
  final RecommendedCafeUseCase cafeUseCase;

  RecommendedCafeCubit(this.cafeUseCase) : super(RecommendedCafeInitialState());

  Future<void> getRecommendedCafes() async {
    emit(RecommendedCafeLoadingState());
    try {
      final cafes = await cafeUseCase.getRecommendedCafes();
      emit(RecommendedCafeLoadedState(recommendedCafes: cafes));
    } catch (e) {
      emit(RecommendedCafeErrorState(message: e.toString()));
    }
  }
}
