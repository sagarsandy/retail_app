import 'package:flutter/material.dart';
import 'package:retail_admin/core/constants/ss_dimensions.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class SSAlertWidget extends StatelessWidget {
  final String title;
  final String description;
  final String cancelButtonTitle;
  final String actionButtonTitle;
  final VoidCallback? onAction;

  const SSAlertWidget({
    super.key,
    required this.title,
    required this.description,
    this.cancelButtonTitle = 'Cancel',
    this.actionButtonTitle = 'OK',
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SSDimensions.borderRadiusM),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SSDimensions.spacingL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.extraLarge(
                    SSColors.black,
                    fontWeight: FontWeightType.extraBold,
                  ),
            ),
            const SizedBox(height: SSDimensions.spacingM),
            Text(
              description,
              style: Theme.of(context).textTheme.regular(SSColors.black3),
            ),
            const SizedBox(height: SSDimensions.spacingL),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    cancelButtonTitle,
                    style: Theme.of(context).textTheme.regular(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ),
                const SizedBox(width: SSDimensions.spacingM),
                ElevatedButton(
                  onPressed: () {
                    onAction?.call();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SSColors.action,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SSDimensions.borderRadiusS),
                    ),
                  ),
                  child: Text(
                    actionButtonTitle,
                    style: Theme.of(context).textTheme.regular(
                          SSColors.white,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
