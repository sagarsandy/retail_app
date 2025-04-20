import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_core_font.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../app/theme/ss_colors.dart';

class SSBottomNavBar extends StatelessWidget {
  final List<IconData> icons;
  final List<String> titles;
  final int? selectedIndex;
  final Function(int) onItemTap;
  const SSBottomNavBar({
    super.key,
    required this.icons,
    required this.titles,
    required this.onItemTap,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 1, bottom: 30),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: SSColors.white,
        borderRadius: BorderRadius.circular(48),
        boxShadow: [
          BoxShadow(
            color: SSColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onItemTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: isSelected ? 6 : 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: isSelected ? 2 : 0,
                  color: isSelected ? SSColors.action : SSColors.transparent,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    child: Icon(
                      icons[index],
                      color: isSelected ? SSColors.action : SSColors.action,
                      size: isSelected ? 28 : 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    style: Theme.of(context).textTheme.small(
                          isSelected ? SSColors.action : SSColors.action,
                          fontWeight: isSelected
                              ? FontWeightType.extraBold
                              : FontWeightType.normal,
                        ),
                    child: Text(
                      titles[index],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
