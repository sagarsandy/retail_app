import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/home/cubit/explore/explore_cafe_cubit.dart';
import 'package:retail_app/features/food/home/cubit/explore/explore_cafe_state.dart';
import 'package:retail_app/features/food/home/presentation/widgets/explore_top_cafe/explore_cafe_list_item_widget.dart';

class ExploreTopCafesWidget extends StatefulWidget {
  const ExploreTopCafesWidget({super.key});

  @override
  State<ExploreTopCafesWidget> createState() => _ExploreTopCafesWidgetState();
}

class _ExploreTopCafesWidgetState extends State<ExploreTopCafesWidget> {
  final ExploreCafeCubit exploreCafeCubit = locator<ExploreCafeCubit>();

  @override
  void initState() {
    exploreCafeCubit.getExploreCafes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: exploreCafeCubit,
        builder: (context, state) {
          if (state is ExploreCafeLoadedState) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ExploreCafeListItemWidget(cafe: state.cafes[index]);
                },
                childCount: state.cafes.length, // This can be dynamic
              ),
            );
          }
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: SizedBox.shrink(),
            ),
          );
        });
  }
}
