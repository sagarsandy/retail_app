import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import 'star_distribution_widget.dart';

class ReviewsHeaderWidget extends StatelessWidget {
  const ReviewsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side - Overall rating
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '4.8',
                  style: Theme.of(context).textTheme.custom(
                        SSColors.black3,
                        fontSize: 36,
                        fontWeight: FontWeightType.bold,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4 ? Icons.star : Icons.star_half,
                      color: SSColors.action,
                      size: 20,
                    );
                  }),
                ),
                const SizedBox(height: 8),
                Text(
                  '783 Reviews',
                  style: Theme.of(context).textTheme.medium(
                        SSColors.grey1,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Right side - Star distribution
          const Expanded(
            flex: 3,
            child: StarDistributionWidget(),
          ),
        ],
      ),
    );
  }
}
