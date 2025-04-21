import '../../../common/model/cafe.dart';

abstract class ExploreCafeState {
  const ExploreCafeState();
}

class ExploreCafeInitialState extends ExploreCafeState {}

class ExploreCafeLoadingState extends ExploreCafeState {}

class ExploreCafeLoadedState extends ExploreCafeState {
  final List<Cafe> cafes;

  const ExploreCafeLoadedState({required this.cafes});
}

class ExploreCafeErrorState extends ExploreCafeState {
  final String message;

  const ExploreCafeErrorState({required this.message});
}
