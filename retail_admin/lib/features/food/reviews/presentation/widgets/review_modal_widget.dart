import 'package:flutter/material.dart';
import 'package:retail_admin/features/food/common/utils/date_util.dart';
import 'package:retail_admin/features/food/reviews/domain/models/review_model.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class ReviewAlertModelWidget {
  static void showFullReview(BuildContext context, ReviewModel review) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.title,
              style: Theme.of(context).textTheme.large(
                    SSColors.black3,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  review.reviewerName,
                  style: Theme.of(context).textTheme.medium(
                        SSColors.black3,
                        fontWeight: FontWeightType.bold,
                      ),
                ),
                const SizedBox(width: 8),
                Text(
                  review.date.fullDateTime(),
                  style: Theme.of(context).textTheme.medium(
                        SSColors.grey1,
                      ),
                ),
              ],
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Text(
            review.review,
            style: Theme.of(context).textTheme.regular(
                  SSColors.black3,
                ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close Now',
              style: Theme.of(context).textTheme.medium(
                    SSColors.action,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
