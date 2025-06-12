import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../../../../core/presentation/widgets/ss_expansion_tile_widget.dart';

class PrimaryCategoriesWidget extends StatefulWidget {
  const PrimaryCategoriesWidget({super.key});

  @override
  State<PrimaryCategoriesWidget> createState() =>
      _PrimaryCategoriesWidgetState();
}

class _PrimaryCategoriesWidgetState extends State<PrimaryCategoriesWidget> {
  final List<String> gridItems1 = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8"
  ];
  final List<String> gridItems2 = [
    "Item A",
    "Item B",
    "Item C",
    "Item D",
    "Item E",
    "Item F",
    "Item G",
    "Item H"
  ];
  final List<String> gridItems3 = [
    "Item X",
    "Item Y",
    "Item Z",
    "Item W",
    "Item V",
    "Item U",
    "Item T",
    "Item S"
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _buildGridSection("Grocery & Kitchen", gridItems1),
          const SizedBox(height: 16),
          _buildGridSection("Snacks & Drinks", gridItems2),
          const SizedBox(height: 16),
          _buildGridSection("Home & Furniture", gridItems3),
        ],
      ),
    );
  }

  Widget _buildGridSection(String headerTitle, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SSExpansionTileWidget(
        title: headerTitle,
        children: [
          const SizedBox(height: 2), // Spacer
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              childAspectRatio: 0.85,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity - 20,
                        decoration: BoxDecoration(
                          color: SSColors.primary1F.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2), // Spacer
                    SizedBox(
                      height: 34,
                      child: Text(
                        "${items[index]} Long title again",
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
              );
            },
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
