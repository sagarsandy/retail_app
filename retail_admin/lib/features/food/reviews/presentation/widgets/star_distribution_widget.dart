import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class StarDistributionWidget extends StatelessWidget {
  const StarDistributionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        final starCount = 5 - index;
        final count = _getCountForStars(starCount);
        final percentage = _getPercentageForStars(starCount);

        return GestureDetector(
          onTap: () {
            // TODO: Implement filter by star count
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Text(
                  '$starCount',
                  style: Theme.of(context).textTheme.medium(
                        SSColors.black3,
                        fontWeight: FontWeightType.bold,
                      ),
                ),
                const Icon(
                  Icons.star,
                  size: 16,
                  color: SSColors.action,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: percentage,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        SSColors.action,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.medium(
                        SSColors.grey1,
                      ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  int _getCountForStars(int stars) {
    // Mock data - replace with actual data
    switch (stars) {
      case 5:
        return 450;
      case 4:
        return 200;
      case 3:
        return 80;
      case 2:
        return 40;
      case 1:
        return 13;
      default:
        return 0;
    }
  }

  double _getPercentageForStars(int stars) {
    final count = _getCountForStars(stars);
    final total = 783; // Total number of reviews
    return count / total;
  }
}
