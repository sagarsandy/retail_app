import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/features/food/home/domain/use_case/explore_cafe_use_case.dart';

import 'explore_cafe_state.dart';

class ExploreCafeCubit extends Cubit<ExploreCafeState> {
  final ExploreCafeUseCase exploreCafeUseCase;
  ExploreCafeCubit(this.exploreCafeUseCase) : super(ExploreCafeInitialState());

  void getExploreCafes() async {
    emit(ExploreCafeLoadingState());
    try {
      final cafes = await exploreCafeUseCase.getExploreCafes();
      emit(ExploreCafeLoadedState(cafes: cafes));
    } catch (e) {
      emit(ExploreCafeErrorState(message: e.toString()));
    }
  }
}
