import 'package:flutter/material.dart';
import 'package:retail_admin/core/presentation/widgets/admin_sidebar_menu_widget.dart';
import 'package:retail_admin/di/service_locator.dart';
import 'package:retail_admin/features/food/food_items/presentation/widgets/filters_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../cubit/food_items_cubit.dart';
import '../widgets/food_items_app_bar_widget.dart';
import '../widgets/food_items_content_widget.dart';

class FoodItemsPage extends StatefulWidget {
  const FoodItemsPage({super.key});

  @override
  State<FoodItemsPage> createState() => _FoodItemsPageState();
}

class _FoodItemsPageState extends State<FoodItemsPage> {
  final FoodItemsCubit foodItemsCubit = locator<FoodItemsCubit>();

  @override
  void initState() {
    super.initState();
    foodItemsCubit.getFoodItems();
  }

  void _handleFilterSelected(String filterType) {
    foodItemsCubit.filterFoodItems(filterType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FoodItemsAppBarWidget(),
      drawer: const AdminSideBarMenuWidget(selectedIndex: 5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              FiltersWidget(onFilterSelected: _handleFilterSelected),
              const SizedBox(height: 8),
              FoodItemsContentWidget(foodItemsCubit: foodItemsCubit),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
