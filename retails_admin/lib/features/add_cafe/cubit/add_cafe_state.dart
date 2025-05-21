part of 'add_cafe_cubit.dart';

abstract class AddCafeState {
  const AddCafeState();
}

class AddCafeInitialState extends AddCafeState {
  const AddCafeInitialState();
}

class AddCafeLoadingState extends AddCafeState {
  const AddCafeLoadingState();
}

class AddCafeSuccessState extends AddCafeState {
  const AddCafeSuccessState();
  // final String successMessage;
  // const AddCafeSuccessState({required this.successMessage});
}

class AddCafeFailureState extends AddCafeState {
  final String message;
  const AddCafeFailureState({required this.message});
}
