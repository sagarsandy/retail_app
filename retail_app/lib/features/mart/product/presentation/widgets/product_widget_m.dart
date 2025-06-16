import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_tag_text_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_outline_button_widget.dart';

class ProductWidgetM extends StatelessWidget {
  const ProductWidgetM({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: double.infinity - 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: SSColors.primary1M.withOpacity(0.2),
                        width: 1,
                      ),
                      color: SSColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: SSColors.primary1F.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 20,
                    width: 50,
                    child: SSOutlineButtonWidget(
                      title: "ADD",
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, top: 2),
            child: Column(
              children: [
                const Row(
                  children: [
                    SSTagTextWidget(tagTitle: "1000g"),
                    SizedBox(width: 4),
                    SSTagTextWidget(tagTitle: "Quantity 4"),
                  ],
                ),
                const SizedBox(height: 2), // Spacer
                SizedBox(
                  height: 50,
                  child: Text(
                    "Whole Farm Premium Organic Chicken, 1.5 kg can be packed",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.regular(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const SizedBox(width: 4),
                    Text(
                      "₹99",
                      style: Theme.of(context).textTheme.medium(
                            SSColors.black,
                            fontWeight: FontWeightType.bold,
                          ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "₹199",
                      style: Theme.of(context).textTheme.small(
                            SSColors.black,
                            isStrikeThrough: true,
                          ),
                    ),
                    const SizedBox(width: 4),
                    // SizedBox(
                    //   height: 20,
                    //   child: SSOutlineButtonWidget(
                    //     title: "ADD",
                    //     onTap: () {},
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
