import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class OrderInfoItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const OrderInfoItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 35,
          color: SSColors.transparent.action(),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.large(
                      SSColors.black,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
              Text(
                subtitle,
                maxLines: 2,
                style: Theme.of(context).textTheme.regular(
                      SSColors.grey1,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
