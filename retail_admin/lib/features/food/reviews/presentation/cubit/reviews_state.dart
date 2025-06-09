import '../../domain/models/review_model.dart';

abstract class ReviewsState {
  const ReviewsState();
}

class ReviewsInitialState extends ReviewsState {
  const ReviewsInitialState();
}

class ReviewsLoadingState extends ReviewsState {
  const ReviewsLoadingState();
}

class ReviewsSuccessState extends ReviewsState {
  final List<ReviewModel> reviews;
  const ReviewsSuccessState({required this.reviews});
}

class ReviewsErrorState extends ReviewsState {
  final String message;
  const ReviewsErrorState(this.message);
}
