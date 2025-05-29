import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../../common/enums/food_type.dart';

class FiltersWidget extends StatefulWidget {
  final Function(String) onFilterSelected;
  const FiltersWidget({super.key, required this.onFilterSelected});

  @override
  FiltersWidgetState createState() => FiltersWidgetState();
}

class FiltersWidgetState extends State<FiltersWidget> {
  final List<FoodType> filters = FoodType.values;
  String? selectedFilter;

  @override
  initState() {
    super.initState();
    selectedFilter = filters.first.title;
  }

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
          final isSelected = selectedFilter == filter.title;
          return FilterChip(
            label: Text(filter.title),
            selected: isSelected,
            onSelected: (bool selected) {
              setState(() {
                selectedFilter = filter.title;
              });
              widget.onFilterSelected(selectedFilter!);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // more rounded
              side: BorderSide(
                width: isSelected ? 2 : 1,
                color: isSelected ? SSColors.action : SSColors.grey1,
              ), // purple border
            ),
            selectedColor: SSColors.transparent,
            checkmarkColor: isSelected ? SSColors.action : SSColors.black,
            backgroundColor: SSColors.white,
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
