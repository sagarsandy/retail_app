import 'package:flutter/material.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../core/presentation/widgets/ss_expansion_tile_widget.dart';
import '../../domain/models/cafe_details.dart';
import 'item/cafe_item_design_widget.dart';
import 'item/cafe_item_info_widget.dart';

class CafeItemsListWidget extends StatelessWidget {
  final List<CafeItemCategory> cafeItemCategories;
  const CafeItemsListWidget({super.key, required this.cafeItemCategories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cafeItemCategories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16),
        itemBuilder: (context, catIndex) {
          if (cafeItemCategories[catIndex].cafeItems == null ||
              cafeItemCategories[catIndex].cafeItems!.isEmpty) {
            return const SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: SSExpansionTileWidget(
              title:
                  "${cafeItemCategories[catIndex].name} (${cafeItemCategories[catIndex].cafeItems?.length})",
              children: [
                const SizedBox(height: 1),
                ListView.builder(
                  itemCount:
                      cafeItemCategories[catIndex].cafeItems?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final cafeItem =
                        cafeItemCategories[catIndex].cafeItems![index];
                    return Container(
                      height: 140,
                      color: SSColors.white,
                      margin: const EdgeInsets.only(
                          bottom: 8.0, top: 8.0, right: 4.0),
                      child: Row(
                        children: [
                          CafeItemInfoWidget(cafeItem: cafeItem),
                          const SizedBox(width: 8),
                          CafeItemDesignWidget(cafeItem: cafeItem),
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
