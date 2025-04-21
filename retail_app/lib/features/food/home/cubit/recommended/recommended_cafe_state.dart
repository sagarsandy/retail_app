import 'package:retail_app/features/food/common/model/cafe.dart';

abstract class RecommendedCafeState {
  const RecommendedCafeState();
}

class RecommendedCafeInitialState extends RecommendedCafeState {}

class RecommendedCafeLoadingState extends RecommendedCafeState {}

class RecommendedCafeLoadedState extends RecommendedCafeState {
  final List<Cafe> recommendedCafes;

  const RecommendedCafeLoadedState({required this.recommendedCafes});
}

class RecommendedCafeErrorState extends RecommendedCafeState {
  final String message;

  const RecommendedCafeErrorState({required this.message});
}
