import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_icon_button.dart';

import '../../../../../app/theme/ss_colors.dart';

class FavouriteIconWidget extends StatefulWidget {
  const FavouriteIconWidget({super.key});

  @override
  State<FavouriteIconWidget> createState() => _FavouriteIconWidgetState();
}

class _FavouriteIconWidgetState extends State<FavouriteIconWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SSIconButton(
        padding: const EdgeInsets.only(right: 12),
        icon: Visibility(
            visible: isSelected,
            replacement: const Icon(
              Icons.favorite_border,
              color: SSColors.black,
              size: 24.0,
            ),
            child: const Icon(
              Icons.favorite,
              color: SSColors.black,
              size: 24.0,
            )),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        });
  }
}
