import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

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
            style: Theme.of(context).textTheme.extraLarge(SSColors.primary1F),
          ),
          const SizedBox(height: 20),
          Text(
            'Sub Text Page 1',
            style: Theme.of(context)
                .textTheme
                .extraLarge(SSColors.primary1F, fontWeight: FontWeightType.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Sub Text Page 2',
            style: Theme.of(context).textTheme.extraLarge(SSColors.primary1F,
                fontWeight: FontWeightType.extraBold),
          ),
        ],
      ),
    );
  }
}
