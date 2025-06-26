import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: SSColors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Address",
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
              const Spacer(),
              Text(
                "Change",
                style: Theme.of(context).textTheme.regular(
                      SSColors.actionM,
                      isUnderLine: true,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "67-7-1, Near NSM School, Darsi peta-2, Vijayawada. 520010.",
            style: Theme.of(context).textTheme.medium(
                  SSColors.black,
                ),
          ),
        ],
      ),
    );
  }
}
