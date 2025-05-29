import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

enum SSToastType { success, info, error, warning }

class SSToast {
  static void _showToast(
    BuildContext context,
    String message, {
    SSToastType type = SSToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final Color backgroundColor;
    final IconData icon;

    switch (type) {
      case SSToastType.success:
        backgroundColor = Colors.green;
        icon = Icons.check_circle_outline;
      case SSToastType.error:
        backgroundColor = SSColors.error1;
        icon = Icons.error_outline;
      case SSToastType.warning:
        backgroundColor = Colors.orange;
        icon = Icons.warning_amber_rounded;
      case SSToastType.info:
        backgroundColor = SSColors.action;
        icon = Icons.info_outline;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              icon,
              color: SSColors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.regular(
                      SSColors.white,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
        duration: duration,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: SSColors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  // Public methods that handle post frame callback
  static void show(
    BuildContext context,
    String message, {
    SSToastType type = SSToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showToast(context, message, type: type, duration: duration);
    });
  }

  static void success(BuildContext context, String message) {
    show(context, message, type: SSToastType.success);
  }

  static void error(BuildContext context, String message) {
    show(context, message, type: SSToastType.error);
  }

  static void warning(BuildContext context, String message) {
    show(context, message, type: SSToastType.warning);
  }

  static void info(BuildContext context, String message) {
    show(context, message, type: SSToastType.info);
  }
}
