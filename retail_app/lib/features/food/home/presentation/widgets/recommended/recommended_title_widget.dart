import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../../app/theme/ss_colors.dart';
import '../../../../../../app/theme/ss_core_font.dart';

class RecommendedTitleWidget extends StatelessWidget {
  const RecommendedTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Recommended for you',
        style: Theme.of(context).textTheme.extraLarge(
              SSColors.black,
              fontWeight: FontWeightType.bold,
            ),
      ),
    );
  }
}
