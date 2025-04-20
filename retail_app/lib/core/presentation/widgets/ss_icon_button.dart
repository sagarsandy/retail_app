import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_colors.dart';

class SSIconButton extends StatelessWidget {
  final Widget icon;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Function() onPressed;
  const SSIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      splashColor: SSColors.transparent,
      highlightColor: SSColors.transparent,
      icon: icon,
      onPressed: () {
        onPressed();
      },
    );
  }
}
