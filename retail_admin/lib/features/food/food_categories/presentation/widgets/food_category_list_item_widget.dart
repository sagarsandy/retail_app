import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import '../../domain/models/food_category.dart';

class FoodCategoryListItemWidget extends StatelessWidget {
  final FoodCategory category;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool isLoading;

  const FoodCategoryListItemWidget({
    super.key,
    required this.category,
    required this.onEdit,
    required this.onDelete,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: SSColors.grey1.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Opacity(
        opacity: isLoading ? 0.5 : 1.0,
        child: AbsorbPointer(
          absorbing: isLoading,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onEdit,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      category.title,
                      style: Theme.of(context).textTheme.large(
                            SSColors.black,
                            fontWeight: FontWeightType.bold,
                          ),
                    ),
                  ),
                  Tooltip(
                    message: 'Delete Category',
                    child: Material(
                      color: SSColors.error1.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: isLoading ? null : onDelete,
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          width: 30,
                          height: 30,
                          child: Center(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                SSColors.action),
                                      ),
                                    )
                                  : Icon(
                                      Icons.delete_outline,
                                      color: SSColors.error1.withOpacity(0.8),
                                      size: 18,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
