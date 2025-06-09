import 'package:flutter/material.dart';
import 'package:retail_admin/features/food/reviews/domain/models/review_model.dart';

import 'review_card_widget.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 10, // Replace with actual review count
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return ReviewCardWidget(
          review: ReviewModel(
            id: "1",
            reviewerName: "Kita Chihoko",
            title: 'A Cut Above the Rest',
            review:
                'I recently visited this barber, and I must say it was a classic barber experience. He took the time to understand exactly what I wanted, I recently visited this barber, and I must say it was a classic barber experience.',
            rating: 4.5,
            date: DateTime.now(),
          ),
        );
      },
    );
  }
}
