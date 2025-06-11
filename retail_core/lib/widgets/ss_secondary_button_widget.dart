import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../theme/ss_colors.dart';

class SSSecondaryButtonWidget extends StatelessWidget {
  final String title;
  final Color? primaryColor;
  final Function() onTap;
  const SSSecondaryButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.primaryColor = SSColors.primary1F,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: SSColors.white.withOpacity(0.2),
        surfaceTintColor: SSColors.primary1F, // Highlighted color
        padding: EdgeInsets.zero,
        side: const BorderSide(color: SSColors.actionF, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 9,
      ),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.medium(SSColors.actionF, fontWeight: FontWeightType.bold),
      ),
    );
  }
}
