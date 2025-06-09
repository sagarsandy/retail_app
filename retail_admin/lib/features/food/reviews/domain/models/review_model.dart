// Review model for the reviews feature
class ReviewModel {
  final String id;
  final String reviewerName;
  final String title;
  final String review;
  final double rating;
  final DateTime date;

  ReviewModel({
    required this.id,
    required this.reviewerName,
    required this.title,
    required this.review,
    required this.rating,
    required this.date,
  });
}
