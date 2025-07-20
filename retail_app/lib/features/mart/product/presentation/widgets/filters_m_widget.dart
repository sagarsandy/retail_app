import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';

class FiltersMWidget extends StatelessWidget {
  const FiltersMWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: SSColors.transparent.action(),
    );
  }
}
