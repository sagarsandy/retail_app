import '../models/review_model.dart';

abstract class ReviewsRepository {
  Future<List<ReviewModel>> getReviews();
  Future<void> addReview(ReviewModel review);
  Future<void> updateReview(ReviewModel review);
  Future<void> deleteReview(String id);
}
