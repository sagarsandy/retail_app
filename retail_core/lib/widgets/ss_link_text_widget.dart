import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../theme/ss_colors.dart';

class SSLinkTextWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  const SSLinkTextWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme
            .regular(SSColors.black, isUnderLine: true)
            .copyWith(fontStyle: FontStyle.italic),
      ),
    );
  }
}
