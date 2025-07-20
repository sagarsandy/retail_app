import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../../../../core/presentation/widgets/ss_tag_text_widget.dart';

class OrderDetailsProductWidget extends StatelessWidget {
  const OrderDetailsProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: SSColors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 80,
            decoration: BoxDecoration(
              color: SSColors.transparent.surface(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/mart/chicken.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "This is long product name that should be truncated if it exceeds the available space. Let's add some more text to ensure it overflows.",
                  maxLines: 3,
                  style: Theme.of(context).textTheme.regular(
                        SSColors.black,
                        fontWeight: FontWeightType.bold,
                      ),
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    SSTagTextWidget(tagTitle: "1000g"),
                    SizedBox(width: 4),
                    SSTagTextWidget(tagTitle: "Quantity 4"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SSTagTextWidget(tagTitle: " Qty : 4 "),
                const SizedBox(height: 8),
                SizedBox(
                  width: 70,
                  height: 20,
                  child: Text(
                    "₹200.00",
                    style: Theme.of(context).textTheme.medium(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
