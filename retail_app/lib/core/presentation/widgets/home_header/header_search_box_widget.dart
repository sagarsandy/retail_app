import 'package:flutter/material.dart';
import 'package:retail_app/core/enums/app_enum.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class HeaderSearchBoxWidget extends StatelessWidget {
  final AppType appType;
  const HeaderSearchBoxWidget({
    super.key,
    required this.appType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: SSColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: SSColors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color:
                  appType == AppType.food ? SSColors.actionF : SSColors.actionM,
            ),
            const SizedBox(width: 10),
            Text(
              "Search for ${appType == AppType.food ? 'food' : 'products'}",
              style: Theme.of(context).textTheme.medium(SSColors.grey1),
            ),
          ],
        ),
      ),
    );
  }
}
