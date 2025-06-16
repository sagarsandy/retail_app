import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class SSTagTextWidget extends StatelessWidget {
  final String tagTitle;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  const SSTagTextWidget(
      {super.key,
      required this.tagTitle,
      this.textStyle,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: backgroundColor ?? SSColors.grey1.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 2.0,
          vertical: 1.0,
        ),
        child: Text(
          tagTitle,
          style: textStyle ??
              Theme.of(context).textTheme.small(
                    SSColors.black,
                  ),
        ),
      ),
    );
  }
}
