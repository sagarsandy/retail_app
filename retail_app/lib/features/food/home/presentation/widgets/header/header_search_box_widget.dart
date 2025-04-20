import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../../app/theme/ss_colors.dart';

class HeaderSearchBoxWidget extends StatelessWidget {
  const HeaderSearchBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 50,
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
            const Icon(
              Icons.search,
              color: SSColors.action,
            ),
            const SizedBox(width: 10),
            Text(
              "Search for food",
              style: Theme.of(context).textTheme.medium(SSColors.grey1),
            ),
          ],
        ),
      ),
    );
  }
}
