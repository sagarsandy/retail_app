import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

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
        childAspectRatio: 0.85,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            context.goToPage(SSAppRoutes.martProductListing,
                extra: {'primaryCategory': {}});
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(
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
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2), // Spacer
                SizedBox(
                  height: 34,
                  child: Text(
                    "Edible Oil",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.regular(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
