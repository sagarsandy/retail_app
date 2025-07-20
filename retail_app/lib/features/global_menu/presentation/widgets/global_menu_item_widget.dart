import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class GlobalMenuItemWidget extends StatelessWidget {
  final String title;
  const GlobalMenuItemWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: SSColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.large(
                    SSColors.black2,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 30,
              color: SSColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
