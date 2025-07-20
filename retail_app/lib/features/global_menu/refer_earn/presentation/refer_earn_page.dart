import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_app/core/presentation/widgets/ss_app_bar_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class ReferEarnPage extends StatelessWidget {
  const ReferEarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.transparent.surface(),
      appBar: const SSAppBarWidget(
        showTitle: true,
        title: "Refer & Earn",
        showLeadingIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: SSColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thank you for being a valued customer!",
                style: Theme.of(context).textTheme.large(
                      SSColors.black,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "Refer a friend and earn rewards! Share your unique referral code and get rewarded when they make their first purchase.",
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "Referral bonus: ₹50 for you and ₹50 for your friend on their first purchase.",
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "Referral code: We made it very simple, just use your phone number as the referral code.",
                style: Theme.of(context).textTheme.large(
                      SSColors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
