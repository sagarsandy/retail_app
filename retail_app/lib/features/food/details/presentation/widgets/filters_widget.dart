import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_core_font.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../app/theme/ss_colors.dart';

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({super.key});

  @override
  FiltersWidgetState createState() => FiltersWidgetState();
}

class FiltersWidgetState extends State<FiltersWidget> {
  final List<String> filters = [
    "Veg",
    "Non-veg",
    "Egg",
  ];

  final Set<String> selectedFilters = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilters.contains(filter);
          return FilterChip(
            label: Text(filter),
            selected: isSelected,
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  selectedFilters.add(filter);
                } else {
                  selectedFilters.remove(filter);
                }
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // more rounded
              side: BorderSide(
                width: isSelected ? 2 : 1,
                color: isSelected ? SSColors.action : SSColors.grey1,
              ), // purple border
            ),
            selectedColor: Colors.transparent,
            checkmarkColor: isSelected ? SSColors.action : SSColors.black,
            backgroundColor: Colors.transparent,
            labelStyle: Theme.of(context).textTheme.regular(
                  isSelected ? SSColors.action : SSColors.black,
                  fontWeight: isSelected
                      ? FontWeightType.extraBold
                      : FontWeightType.bold,
                ),
          );
        },
      ),
    );
  }
}
