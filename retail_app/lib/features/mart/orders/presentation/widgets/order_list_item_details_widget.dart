import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class OrderListItemDetailsWidget extends StatelessWidget {
  final String title;
  final String value;
  const OrderListItemDetailsWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.medium(
                SSColors.black3,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.medium(
                SSColors.black3,
                fontWeight: FontWeightType.bold,
              ),
        ),
      ],
    );
  }
}
