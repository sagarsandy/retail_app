import 'package:flutter/material.dart';
import 'package:retail_admin/features/food/common/utils/date_util.dart';
import 'package:retail_admin/features/food/reviews/domain/models/review_model.dart';
import 'package:retail_admin/features/food/reviews/presentation/widgets/review_modal_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class ReviewCardWidget extends StatelessWidget {
  final ReviewModel review;

  const ReviewCardWidget({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reviewer info and rating
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    review.reviewerName.isNotEmpty
                        ? review.reviewerName[0].toUpperCase()
                        : '?',
                    style: Theme.of(context).textTheme.large(
                          SSColors.black3,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.reviewerName,
                        style: Theme.of(context).textTheme.medium(
                              SSColors.black3,
                              fontWeight: FontWeightType.bold,
                            ),
                      ),
                      Text(
                        review.date.fullDateTime(),
                        style: Theme.of(context).textTheme.regular(
                              SSColors.grey1,
                            ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < review.rating.floor()
                            ? Icons.star
                            : index < review.rating
                                ? Icons.star_half
                                : Icons.star_border,
                        color: SSColors.action,
                        size: 20,
                      );
                    }),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Review title
            Text(
              review.title,
              style: Theme.of(context).textTheme.large(
                    SSColors.black3,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
            const SizedBox(height: 8),
            // Review content with Read more
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.review,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.regular(
                        SSColors.black3,
                      ),
                ),
                if (review.review.length >
                    140) // Show read more if text is long
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: GestureDetector(
                      onTap: () => ReviewAlertModelWidget.showFullReview(
                          context, review),
                      child: Text(
                        'Read more',
                        style: Theme.of(context).textTheme.medium(
                              SSColors.action,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
