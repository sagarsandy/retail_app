import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../app/theme/ss_colors.dart';
import '../../../app/theme/ss_core_font.dart';

class SSButtonWidget extends StatelessWidget {
  final String title;
  final Color? primaryColor;
  final Function() onTap;
  const SSButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.primaryColor = SSColors.primary1,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: SSColors.white.withOpacity(0.2),
        surfaceTintColor: SSColors.primary1, // Highlighted color
        padding: EdgeInsets.zero,
        side: const BorderSide(color: SSColors.action, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 9,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.medium(
              SSColors.action,
              fontWeight: FontWeightType.bold,
            ),
      ),
    );
  }
}
