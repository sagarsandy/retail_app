import 'package:flutter/material.dart';
import 'package:retail_app/core/constants/ui_constants.dart';
import 'package:retail_app/features/food/details/presentation/widgets/coupons_widget.dart';
import 'package:retail_app/features/food/details/presentation/widgets/filters_widget.dart';
import 'package:retail_app/features/food/details/presentation/widgets/info_widget.dart';
import 'package:retail_app/features/food/details/presentation/widgets/items_list_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: UIConstants.leftPadding,
          right: UIConstants.leftPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InfoWidget(
              title: "SS Sweet Magic",
              location: "Auto nagar, Vijayawada",
              deliveryTime: " 20-30mnts",
              openTime: "10:00 AM",
              closeTime: "11:00 PM",
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 95,
              child: CouponsWidget(),
            ),
            SizedBox(height: 24),
            FiltersWidget(),
            SizedBox(height: 12),
            ItemsListWidget(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
