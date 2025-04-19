import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_core_font.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../app/theme/ss_colors.dart';

class TrailWidget extends StatelessWidget {
  final String title;
  const TrailWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.extraLarge(SSColors.primary1),
          ),
          const SizedBox(height: 20),
          Text(
            'Sub Text Page 1',
            style: Theme.of(context)
                .textTheme
                .extraLarge(SSColors.primary1, fontWeight: FontWeightType.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Sub Text Page 2',
            style: Theme.of(context).textTheme.extraLarge(SSColors.primary1,
                fontWeight: FontWeightType.extraBold),
          ),
        ],
      ),
    );
  }
}
