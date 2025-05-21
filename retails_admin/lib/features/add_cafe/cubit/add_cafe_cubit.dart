import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/models/cafe_data.dart';
import '../domain/use_case/add_cafe_use_case.dart';

part 'add_cafe_state.dart';

class AddCafeCubit extends Cubit<AddCafeState> {
  final AddCafeUseCase _addCafeUseCase;

  AddCafeCubit(this._addCafeUseCase) : super(const AddCafeInitialState());

  Future<void> submitAddCafe(CafeData cafeData) async {
    emit(const AddCafeLoadingState());
    try {
      await _addCafeUseCase.addCafe(cafeData);
      emit(const AddCafeSuccessState());
    } catch (e) {
      // In a real app, consider more specific error handling/typing
      emit(AddCafeFailureState(message: e.toString()));
    }
  }
}
