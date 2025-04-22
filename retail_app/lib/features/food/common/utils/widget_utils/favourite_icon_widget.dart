import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_icon_button.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/common/model/cafe.dart';
import 'package:retail_app/features/food/favourite/presentation/cubit/favourite_cubit.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../core/presentation/widgets/ss_toast.dart';

class FavouriteIconWidget extends StatefulWidget {
  final Cafe cafe;
  const FavouriteIconWidget({super.key, required this.cafe});

  @override
  State<FavouriteIconWidget> createState() => _FavouriteIconWidgetState();
}

class _FavouriteIconWidgetState extends State<FavouriteIconWidget> {
  bool isSelected = false;
  final FavouriteCubit favouriteCubit = locator<FavouriteCubit>();

  @override
  void initState() {
    isSelected = favouriteCubit.favouriteCafeIds.contains(widget.cafe.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SSIconButton(
        padding: const EdgeInsets.only(right: 12),
        icon: Visibility(
            visible: isSelected,
            replacement: const Icon(
              Icons.favorite_border,
              color: SSColors.black,
              size: 26.0,
            ),
            child: const Icon(
              Icons.favorite,
              color: SSColors.black,
              size: 26.0,
            )),
        onPressed: () {
          SSToast.showToast(
            message: isSelected
                ? "${widget.cafe.name} removed from favourites"
                : "${widget.cafe.name} added to favourites",
            context: context,
          );
          if (isSelected) {
            favouriteCubit.removeFromFavourites(widget.cafe);
          } else {
            favouriteCubit.addToFavourites(widget.cafe);
          }
          setState(() {
            isSelected = !isSelected;
          });
        });
  }
}
