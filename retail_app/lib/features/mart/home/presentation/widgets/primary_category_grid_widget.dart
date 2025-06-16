import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_app_routes.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/features/mart/home/domain/models/mart_category.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../../../../core/presentation/widgets/ss_expansion_tile_widget.dart';

class PrimaryCategoryGridWidget extends StatelessWidget {
  final MartCategory martCategory;
  const PrimaryCategoryGridWidget({
    super.key,
    required this.martCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SSExpansionTileWidget(
        title: martCategory.name,
        children: [
          const SizedBox(height: 2), // Spacer
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: martCategory.primaryCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  context.pushToPage(SSAppRoutes.martProductListing, extra: {
                    'primaryCategory': martCategory.primaryCategories[index],
                  });
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
                                  image: NetworkImage(martCategory
                                      .primaryCategories[index].imageUrl),
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
                          martCategory.primaryCategories[index].name,
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
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
