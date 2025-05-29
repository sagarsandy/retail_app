import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_admin/core/presentation/widgets/ss_dropdown_widget.dart';
import 'package:retail_admin/core/presentation/widgets/ss_text_field_widget.dart';
import 'package:retail_admin/core/presentation/widgets/ss_toast.dart';
import 'package:retail_admin/di/service_locator.dart';
import 'package:retail_admin/features/food/common/enums/food_type.dart';
import 'package:retail_admin/features/food/food_items/domain/models/food_category.dart';
import 'package:retail_admin/features/food/food_items/domain/models/food_item.dart';
import 'package:retail_admin/features/food/food_items/presentation/cubit/food_items_cubit.dart';
import 'package:retail_admin/features/food/food_items/presentation/cubit/food_items_state.dart';
import 'package:retail_admin/features/food/food_items/presentation/widgets/filters_widget.dart';
import 'package:retail_core/widgets/ss_button_widget.dart';

class ManageFoodItemFormWidget extends StatefulWidget {
  final FoodItem? foodItem;

  const ManageFoodItemFormWidget({
    super.key,
    this.foodItem,
  });

  @override
  State<ManageFoodItemFormWidget> createState() =>
      _ManageFoodItemFormWidgetState();
}

class _ManageFoodItemFormWidgetState extends State<ManageFoodItemFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _originalPriceController = TextEditingController();
  final _imageUrlController = TextEditingController();
  List<FoodType> foodTypes = FoodType.values.toList();
  List<FoodCategory> categories = FoodCategory.getDummyCategories();
  FoodCategory? selectedCategory;

  bool _isVeg = false;
  bool _isEgg = false;
  bool _isNonVeg = false;
  bool _isAvailable = true;

  final FoodItemsCubit _foodItemsCubit = locator<FoodItemsCubit>();

  @override
  void initState() {
    super.initState();
    foodTypes.removeAt(0);
    if (widget.foodItem != null) {
      _loadFoodItem();
    }
  }

  void _loadFoodItem() {
    final item = widget.foodItem!;
    _nameController.text = item.name;
    _descriptionController.text = item.description;
    _priceController.text = item.price.toString();
    _originalPriceController.text = item.originalPrice?.toString() ?? '';
    _imageUrlController.text = item.imageUrl;
    selectedCategory = categories.firstWhere(
      (cat) => cat.id == item.categoryId,
      orElse: () => categories.first,
    );
    _isVeg = item.isVeg;
    _isEgg = item.isEgg;
    _isNonVeg = item.isNonVeg;
    _isAvailable = item.isAvailable;
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final foodItem = FoodItem(
        id: widget.foodItem?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        originalPrice: _originalPriceController.text.isNotEmpty
            ? double.parse(_originalPriceController.text)
            : null,
        categoryId: selectedCategory?.id ?? '',
        imageUrl: _imageUrlController.text,
        isVeg: _isVeg,
        isEgg: _isEgg,
        isNonVeg: _isNonVeg,
        isAvailable: _isAvailable,
      );

      if (widget.foodItem != null) {
        _foodItemsCubit.updateFoodItem(foodItem);
      } else {
        _foodItemsCubit.addFoodItem(foodItem);
      }
    }
  }

  Widget _buildLabel(String text, {bool isRequired = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text + (isRequired ? '*' : ''),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodItemsCubit, FoodItemsState>(
      bloc: _foodItemsCubit,
      builder: (context, state) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Category'),
                  SSDropdownWidget<FoodCategory>(
                    isRequired: true,
                    title: 'category',
                    hint: 'Select category',
                    value: selectedCategory,
                    items: categories,
                    getLabel: (category) => category.name,
                    onChanged: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildLabel('Food Name'),
                  SSTextFieldWidget(
                    isRequired: true,
                    title: 'name',
                    hint: 'Enter food name',
                    controller: _nameController,
                  ),
                  const SizedBox(height: 16),
                  _buildLabel('Food Image'),
                  SSTextFieldWidget(
                    isRequired: true,
                    title: 'image url',
                    hint: 'Enter image url',
                    controller: _imageUrlController,
                  ),
                  const SizedBox(height: 16),
                  _buildLabel('Price'),
                  Row(
                    children: [
                      Expanded(
                        child: SSTextFieldWidget(
                          isRequired: true,
                          title: 'price',
                          hint: 'Enter price',
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SSTextFieldWidget(
                          isRequired: false,
                          title: 'original price',
                          hint: 'Enter original price',
                          controller: _originalPriceController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildLabel('Description'),
                  SSTextFieldWidget(
                    isRequired: true,
                    title: 'description',
                    hint: 'Enter food description',
                    controller: _descriptionController,
                    maxLines: 3,
                    height: 120,
                  ),
                  const SizedBox(height: 8),
                  _buildLabel('Food Type'),
                  FiltersWidget(
                    filters: foodTypes,
                    onFilterSelected: (selectedFilter) {
                      setState(() {
                        _isVeg = selectedFilter == 'Veg';
                        _isEgg = selectedFilter == 'Egg';
                        _isNonVeg = selectedFilter == 'Non-Veg';
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: const Text('Available'),
                    value: _isAvailable,
                    onChanged: (value) {
                      setState(() {
                        _isAvailable = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: SSButtonWidget(
                      title: widget.foodItem != null
                          ? 'Update Food Item'
                          : 'Add Food Item',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _handleSubmit();
                          SSToast.success(context,
                              'Food item ${widget.foodItem != null ? 'updated' : 'added'} successfully');
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _originalPriceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
}
