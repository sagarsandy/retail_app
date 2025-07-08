import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class ApplyCouponWidget extends StatelessWidget {
  const ApplyCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: SSColors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Have a coupon code?",
              style: Theme.of(context).textTheme.medium(
                    SSColors.black,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
