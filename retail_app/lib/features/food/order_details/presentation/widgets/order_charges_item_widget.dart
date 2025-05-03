import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../app/theme/ss_core_font.dart';
import 'order_summary_widget.dart';

class OrderChargesItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final OrderTextStyleType textStyleType;

  const OrderChargesItemWidget({
    super.key,
    required this.title,
    required this.value,
    required this.textStyleType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getTextStyle(textStyleType, context),
        ),
        Text(
          value,
          style: getTextStyle(textStyleType, context),
        ),
      ],
    );
  }

  TextStyle getTextStyle(OrderTextStyleType type, BuildContext context) {
    switch (type) {
      case OrderTextStyleType.regular:
        return Theme.of(context).textTheme.regular(
              SSColors.black,
            );
      case OrderTextStyleType.large:
        return Theme.of(context).textTheme.large(
              SSColors.black,
              fontWeight: FontWeightType.bold,
            );
      default:
        return Theme.of(context).textTheme.medium(
              SSColors.black,
            );
    }
  }
}
