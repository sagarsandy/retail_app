import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_app/core/presentation/widgets/ss_app_bar_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.transparent.surface(),
      appBar: const SSAppBarWidget(
        showTitle: true,
        title: "Support",
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
                "We're Here for You",
                style: Theme.of(context).textTheme.large(
                      SSColors.black,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "Your satisfaction is our priority. If you have questions, issues, or feedback, we're always ready to help. Our support team is just a call away — because you matter to us.",
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                    ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: SSColors.transparent.action(),
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "+91 1234567890",
                      style: Theme.of(context).textTheme.large(
                            SSColors.transparent.action(),
                            fontWeight: FontWeightType.bold,
                            isUnderLine: true,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
