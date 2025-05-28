import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_button_widget.dart';
import '../../domain/models/food_category.dart';

class FoodCategoryDialogWidget extends StatefulWidget {
  final TextEditingController controller;
  final FoodCategory? category;
  final Future<void> Function(String) onSave;

  const FoodCategoryDialogWidget({
    super.key,
    required this.controller,
    required this.onSave,
    this.category,
  });

  @override
  State<FoodCategoryDialogWidget> createState() =>
      _FoodCategoryDialogWidgetState();
}

class _FoodCategoryDialogWidgetState extends State<FoodCategoryDialogWidget> {
  bool _isLoading = false;

  Future<void> _handleSubmit(BuildContext context) async {
    final text = widget.controller.text.trim();
    if (text.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      await widget.onSave(text);
      if (mounted) {
        Navigator.pop(context);
        widget.controller.clear();
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        widget.category == null ? 'Add Category' : 'Update Category',
        style: Theme.of(context).textTheme.large(
              SSColors.black,
              fontWeight: FontWeightType.extraBold,
            ),
      ),
      content: TextField(
        controller: widget.controller,
        autofocus: true,
        enabled: !_isLoading,
        textCapitalization: TextCapitalization.words,
        maxLength: 50,
        onSubmitted: _isLoading ? null : (_) => _handleSubmit(context),
        decoration: InputDecoration(
          hintText: 'Enter category name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: SSColors.primary1, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: SSColors.error1),
          ),
          counterText: '',
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading
              ? null
              : () {
                  widget.controller.clear();
                  Navigator.pop(context);
                },
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.medium(
                  _isLoading ? SSColors.grey1.withOpacity(0.5) : SSColors.grey1,
                ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: _isLoading ? 0 : 1,
              child: SSButtonWidget(
                elevation: 0,
                title: widget.category == null ? 'Add' : 'Update',
                onTap: () => _handleSubmit(context),
              ),
            ),
            if (_isLoading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(SSColors.action),
                ),
              ),
          ],
        ),
      ],
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
    );
  }
}
