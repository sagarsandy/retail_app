import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/review_model.dart';
import '../../domain/use_case/reviews_use_case.dart';
import 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsUseCase useCase;
  ReviewsCubit(this.useCase) : super(const ReviewsInitialState());

  Future<void> getReviews() async {
    try {
      emit(const ReviewsLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      final reviews = await useCase.getReviews();
      emit(ReviewsSuccessState(reviews: reviews));
    } catch (e) {
      emit(ReviewsErrorState('Failed to fetch reviews: $e'));
    }
  }

  Future<void> addReview(ReviewModel review) async {
    try {
      await useCase.addReview(review);
      getReviews();
    } catch (e) {
      emit(ReviewsErrorState('Failed to add review: $e'));
    }
  }

  Future<void> updateReview(ReviewModel review) async {
    try {
      await useCase.updateReview(review);
      getReviews();
    } catch (e) {
      emit(ReviewsErrorState('Failed to update review: $e'));
    }
  }

  Future<void> deleteReview(String id) async {
    try {
      await useCase.deleteReview(id);
      getReviews();
    } catch (e) {
      emit(ReviewsErrorState('Failed to delete review: $e'));
    }
  }
}
