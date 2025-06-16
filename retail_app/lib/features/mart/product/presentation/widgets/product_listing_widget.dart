import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/features/mart/product/presentation/widgets/product_widget.dart';

import '../../../../../app/router/ss_app_routes.dart';

class ProductListingWidget extends StatelessWidget {
  const ProductListingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            context.goToPage(SSAppRoutes.martProductListing,
                extra: {'primaryCategory': {}});
          },
          child: const ProductWidget(),
        );
      },
    );
  }
}
