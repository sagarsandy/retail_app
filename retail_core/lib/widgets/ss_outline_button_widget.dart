import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../theme/ss_colors.dart';

class SSOutlineButtonWidget extends StatelessWidget {
  final String title;
  final Color? primaryColor;
  final Function() onTap;
  const SSOutlineButtonWidget({
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
        padding: EdgeInsets.zero,
        side: const BorderSide(color: SSColors.actionM, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        // elevation: 9,
      ),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.medium(SSColors.actionM, fontWeight: FontWeightType.bold),
      ),
    );
  }
}
