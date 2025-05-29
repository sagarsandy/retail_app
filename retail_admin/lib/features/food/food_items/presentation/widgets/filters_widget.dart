import 'package:flutter/material.dart';
import 'package:retail_admin/core/constants/ss_dimensions.dart';
import 'package:retail_admin/features/food/common/enums/food_type.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class FiltersWidget extends StatefulWidget {
  final List<FoodType> filters;
  final Function(String) onFilterSelected;
  const FiltersWidget({
    super.key,
    required this.onFilterSelected,
    required this.filters,
  });

  @override
  FiltersWidgetState createState() => FiltersWidgetState();
}

class FiltersWidgetState extends State<FiltersWidget> {
  String? selectedFilter;

  @override
  initState() {
    super.initState();
    selectedFilter = widget.filters.first.title;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SSDimensions.spacingXL + SSDimensions.spacingS,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: SSDimensions.spacingM),
        itemBuilder: (context, index) {
          final filter = widget.filters[index];
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
              borderRadius:
                  BorderRadius.circular(SSDimensions.borderRadiusL * 2),
              side: BorderSide(
                width: isSelected ? 2 : 1,
                color: isSelected ? SSColors.action : SSColors.grey1,
              ),
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
