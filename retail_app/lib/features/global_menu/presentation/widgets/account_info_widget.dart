import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          const Icon(
            Icons.account_circle,
            size: 90,
            color: SSColors.grey1,
          ),
          Text(
            "7981466038",
            style: Theme.of(context).textTheme.extraLarge(
                  SSColors.black,
                  fontWeight: FontWeightType.bold,
                ),
          ),
        ],
      ),
    );
  }
}
