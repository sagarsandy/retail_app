import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../theme/ss_colors.dart';

class SSButtonWidget extends StatelessWidget {
  final String title;
  final Color? primaryColor;
  final Function() onTap;
  final double elevation;
  final bool isEnabled;
  const SSButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.primaryColor = SSColors.primary1F,
    this.elevation = 9,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onTap : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? SSColors.actionF : SSColors.grey1,
        surfaceTintColor: SSColors.primary1F, // Highlighted color
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: isEnabled ? elevation : 0,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.medium(
          SSColors.white,
          fontWeight: FontWeightType.extraBold,
        ),
      ),
    );
  }
}
