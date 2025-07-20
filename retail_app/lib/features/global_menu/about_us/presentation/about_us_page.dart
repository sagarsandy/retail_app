import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../../../core/presentation/widgets/ss_app_bar_widget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.transparent.surface(),
      appBar: const SSAppBarWidget(
        showTitle: true,
        title: "About us",
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
                "Local Delivery Service",
                style: Theme.of(context).textTheme.large(
                      SSColors.black,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "We're a passionate team of young minds on a mission to make your everyday essentials easily accessible. Our journey began with a simple idea — to bring fresh groceries straight to your doorstep with speed, reliability, and a personal touch.",
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "At present, we specialize in delivering groceries locally, ensuring quality products and timely service for every order. Whether it's fresh fruits, vegetables, dairy, or daily essentials — we’ve got you covered.",
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "But we’re not stopping here. Very soon, we’ll be expanding our services to include food delivery from your favorite local restaurants, making your life even more convenient.",
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "As a homegrown startup built by youth, we believe in growing with our community. Your trust and satisfaction drive everything we do. Thank you for being a part of our journey.",
                style: Theme.of(context).textTheme.medium(
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
