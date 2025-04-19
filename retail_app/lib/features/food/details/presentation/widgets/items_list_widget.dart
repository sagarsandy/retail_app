import 'package:flutter/material.dart';
import 'package:retail_app/features/food/details/presentation/widgets/item/item_design_widget.dart';
import 'package:retail_app/features/food/details/presentation/widgets/item/item_info_widget.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../core/presentation/widgets/ss_expansion_tile_widget.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16),
        itemBuilder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: SSExpansionTileWidget(
              title: "Biryani(8)",
              children: [
                const SizedBox(height: 1),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 140,
                      color: SSColors.white,
                      margin: const EdgeInsets.only(
                        bottom: 8.0,
                        top: 8.0,
                        right: 4.0,
                      ),
                      child: const Row(
                        children: [
                          ItemInfoWidget(),
                          SizedBox(width: 8),
                          ItemDesignWidget(),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 1),
              ],
            ),
          );
        });
  }
}
