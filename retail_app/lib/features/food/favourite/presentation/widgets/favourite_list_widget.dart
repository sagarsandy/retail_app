import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/features/food/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:retail_app/features/food/favourite/presentation/cubit/favourite_state.dart';

import '../../../../../di/service_locator.dart';
import '../../../home/presentation/widgets/explore_top_cafe/explore_cafe_list_item_widget.dart';

class FavouriteListWidget extends StatefulWidget {
  const FavouriteListWidget({super.key});

  @override
  State<FavouriteListWidget> createState() => _FavouriteListWidgetState();
}

class _FavouriteListWidgetState extends State<FavouriteListWidget> {
  final FavouriteCubit favouriteCubit = locator<FavouriteCubit>();

  @override
  void initState() {
    favouriteCubit.getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: favouriteCubit,
      builder: (context, state) {
        if (state is FavouritesLoadedState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ExploreCafeListItemWidget(
                  cafe: state.favouriteCafes[index],
                );
              },
              childCount: state.favouriteCafes.length, // This can be dynamic
            ),
          );
        }
        return const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
