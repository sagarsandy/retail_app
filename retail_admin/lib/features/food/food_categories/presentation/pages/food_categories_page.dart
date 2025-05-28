import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_admin/core/presentation/widgets/admin_sidebar_menu_widget.dart';
import 'package:retail_admin/di/service_locator.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../domain/models/food_category.dart';
import '../cubit/food_categories_cubit.dart';
import '../cubit/food_categories_state.dart';
import '../widgets/food_categories_empty_state_widget.dart';
import '../widgets/food_categories_error_state_widget.dart';
import '../widgets/food_category_delete_dialog_widget.dart';
import '../widgets/food_category_dialog_widget.dart';
import '../widgets/food_category_list_item_widget.dart';

class FoodCategoriesPage extends StatefulWidget {
  const FoodCategoriesPage({super.key});

  @override
  State<FoodCategoriesPage> createState() => _FoodCategoriesPageState();
}

class _FoodCategoriesPageState extends State<FoodCategoriesPage> {
  final TextEditingController _categoryController = TextEditingController();
  final FoodCategoriesCubit foodCategoriesCubit =
      locator<FoodCategoriesCubit>();
  String? _deletingCategoryId;

  @override
  void initState() {
    super.initState();
    foodCategoriesCubit.getFoodCategories();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SSColors.white,
        title: Text(
          'Food Categories',
          style: Theme.of(context).textTheme.large(
                SSColors.black,
                fontWeight: FontWeightType.extraBold,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: SSColors.black),
            onPressed: () => _showAddCategoryDialog(),
          ),
        ],
      ),
      drawer: AdminSideBarMenuWidget(
        selectedIndex: 4,
        onCloseSidebar: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<FoodCategoriesCubit, FoodCategoriesState>(
        bloc: foodCategoriesCubit,
        builder: (context, state) {
          if (state is FoodCategoriesLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(SSColors.action),
            ));
          }

          if (state is FoodCategoriesErrorState) {
            return FoodCategoriesErrorStateWidget(
              message: state.message,
              onRetry: () => foodCategoriesCubit.getFoodCategories(),
            );
          }

          if (state is FoodCategoriesSuccessState) {
            if (state.categories.isEmpty) {
              return FoodCategoriesEmptyStateWidget(
                onAddCategory: () => _showAddCategoryDialog(),
              );
            }

            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Categories',
                    style: Theme.of(context).textTheme.extraLarge(
                          SSColors.black,
                          fontWeight: FontWeightType.extraBold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${state.categories.length} categories found',
                    style: Theme.of(context).textTheme.medium(SSColors.grey1),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.categories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 4),
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return FoodCategoryListItemWidget(
                          key: ValueKey(category.id),
                          category: category,
                          isLoading: _deletingCategoryId == category.id,
                          onEdit: () =>
                              _showAddCategoryDialog(category: category),
                          onDelete: () => _showDeleteDialog(category),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showAddCategoryDialog({FoodCategory? category}) {
    _categoryController.text = category?.title ?? '';

    showDialog(
      context: context,
      builder: (context) => FoodCategoryDialogWidget(
        controller: _categoryController,
        category: category,
        onSave: (title) async {
          if (category == null) {
            await foodCategoriesCubit.addFoodCategory(
              FoodCategory(
                id: DateTime.now().toString(),
                title: title,
              ),
            );
          } else {
            await foodCategoriesCubit.updateFoodCategory(
              FoodCategory(
                id: category.id,
                title: title,
              ),
            );
          }
        },
      ),
    );
  }

  void _showDeleteDialog(FoodCategory category) {
    showDialog(
      context: context,
      builder: (context) => FoodCategoryDeleteDialogWidget(
        categoryTitle: category.title,
        onDelete: () async {
          setState(() => _deletingCategoryId = category.id);
          await foodCategoriesCubit.deleteFoodCategory(category.id);
          if (mounted) setState(() => _deletingCategoryId = null);
        },
      ),
    );
  }
}
