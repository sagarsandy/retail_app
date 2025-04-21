import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/home/cubit/food_category/food_category_cubit.dart';
import 'package:retail_app/features/food/home/cubit/food_category/food_category_state.dart';
import 'package:retail_app/features/food/home/presentation/widgets/title_widget.dart';

import 'food_category_list_widget.dart';

class FoodCategoryWidget extends StatefulWidget {
  const FoodCategoryWidget({super.key});

  @override
  State<FoodCategoryWidget> createState() => _FoodCategoryWidgetState();
}

class _FoodCategoryWidgetState extends State<FoodCategoryWidget> {
  final FoodCategoryCubit foodCategoryCubit = locator<FoodCategoryCubit>();

  @override
  void initState() {
    foodCategoryCubit.getFoodCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: foodCategoryCubit,
        builder: (context, state) {
          if (state is FoodCategoryLoadedState) {
            return SliverToBoxAdapter(
              child: SizedBox(
                height: 165,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleWidget(title: 'Choose your dish'),
                    const SizedBox(height: 8),
                    Expanded(
                      child: FoodCategoryListWidget(
                        foodCategories: state.categories,
                      ),
                    ),
                  ],
                ),
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
