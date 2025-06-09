import '../models/review_model.dart';

class ReviewsUseCase {
  final List<ReviewModel> _reviews = [
    ReviewModel(
      id: "1",
      reviewerName: "Kita Chihoko",
      title: 'A Cut Above the Rest',
      review:
          'I recently visited this barber, and I must say it was a classic barber experience. He took the time to understand exactly what I wanted, I recently visited this barber, and I must say it was a classic barber experience.',
      rating: 4.5,
      date: DateTime.now(),
    ),
    ReviewModel(
      id: "2",
      reviewerName: "Allysone burgers",
      title: 'A Cut Above the Rest',
      review:
          'I recently visited this barber, and I must say it was a classic barber experience. He took the time to understand exactly what I wanted, I recently visited this barber, and I must say it was a classic barber experience.',
      rating: 4.5,
      date: DateTime.now(),
    )
  ];

  Future<List<ReviewModel>> getReviews() async => _reviews;
  Future<void> addReview(ReviewModel review) async => _reviews.add(review);
  Future<void> updateReview(ReviewModel review) async {
    final index = _reviews.indexWhere((r) => r.id == review.id);
    if (index != -1) _reviews[index] = review;
  }

  Future<void> deleteReview(String id) async {
    _reviews.removeWhere((r) => r.id == id);
  }
}
