import 'package:flutter/material.dart';
import 'package:retail_app/core/constants/ui_constants.dart';
import 'package:retail_app/features/food/cafe_details/domain/models/cafe_details.dart';

import 'cafe_info_widget.dart';
import 'cafe_items_list_widget.dart';
import 'coupons_widget.dart';
import 'filters_widget.dart';

class CafeBodyWidget extends StatelessWidget {
  final CafeDetails cafeDetails;
  final Function(List<String>) onFilterSelected;
  const CafeBodyWidget({
    super.key,
    required this.cafeDetails,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: UIConstants.leftPadding,
          right: UIConstants.leftPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CafeInfoWidget(cafeDetails: cafeDetails),
            const SizedBox(height: 16),
            SizedBox(
              height: 95,
              child: CouponsWidget(
                cafeCoupons: cafeDetails.cafeCoupons ?? [],
              ),
            ),
            const SizedBox(height: 24),
            FiltersWidget(
              onFilterSelected: (List<String> selectedFilters) {
                onFilterSelected(selectedFilters);
              },
            ),
            const SizedBox(height: 12),
            CafeItemsListWidget(
              cafeItemCategories: cafeDetails.cafeItemCategories ?? [],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
