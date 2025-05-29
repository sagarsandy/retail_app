import '../../../common/enums/food_type.dart';
import '../models/food_item.dart';
import '../models/food_item_category.dart';

class FoodItemsUseCase {
  // In-memory storage for demo purposes
  final List<FoodItemCategory> _foodCategories = [
    FoodItemCategory(
      name: 'Breads & Buns',
      foodItems: [
        FoodItem(
          id: '1',
          name: 'Garlic Bread',
          description: 'Freshly baked bread with garlic butter and herbs',
          price: 99.0,
          originalPrice: 129.0,
          categoryId: 'bread',
          imageUrl: 'assets/images/garlic_bread.jpg',
          isVeg: true,
          isEgg: false,
          isNonVeg: false,
        ),
        FoodItem(
          id: '2',
          name: 'Cheese Stuffed Bread',
          description: 'Soft bread stuffed with mozzarella and cheddar cheese',
          price: 149.0,
          categoryId: 'bread',
          imageUrl: 'assets/images/cheese_bread.jpg',
          isVeg: true,
          isEgg: false,
          isNonVeg: false,
          isAvailable: false,
        ),
      ],
    ),
    FoodItemCategory(
      name: 'Biryani',
      foodItems: [
        FoodItem(
          id: '3',
          name: 'Chicken Biryani',
          description:
              'Aromatic basmati rice cooked with tender chicken and spices',
          price: 249.0,
          originalPrice: 299.0,
          categoryId: 'biryani',
          imageUrl: 'assets/images/chicken_biryani.jpg',
          isVeg: false,
          isEgg: false,
          isNonVeg: true,
        ),
        FoodItem(
          id: '4',
          name: 'Veg Biryani',
          description:
              'Fragrant rice with mixed vegetables and authentic spices',
          price: 199.0,
          categoryId: 'biryani',
          imageUrl: 'assets/images/veg_biryani.jpg',
          isVeg: true,
          isEgg: false,
          isNonVeg: false,
        ),
      ],
    ),
    FoodItemCategory(
      name: 'Chinese',
      foodItems: [
        FoodItem(
          id: '5',
          name: 'Egg Fried Rice',
          description: 'Wok-tossed rice with eggs, vegetables, and soy sauce',
          price: 179.0,
          categoryId: 'chinese',
          imageUrl: 'assets/images/egg_fried_rice.jpg',
          isVeg: false,
          isEgg: true,
          isNonVeg: false,
        ),
        FoodItem(
          id: '6',
          name: 'Chilli Paneer',
          description: 'Crispy paneer cubes in spicy Indo-Chinese sauce',
          price: 219.0,
          originalPrice: 249.0,
          categoryId: 'chinese',
          imageUrl: 'assets/images/chilli_paneer.jpg',
          isVeg: true,
          isEgg: false,
          isNonVeg: false,
        ),
      ],
    ),
    FoodItemCategory(
      name: 'Desserts & Ice Cream',
      foodItems: [
        FoodItem(
          id: '7',
          name: 'Chocolate Brownie',
          description: 'Rich and fudgy brownie with chocolate chips',
          price: 129.0,
          categoryId: 'desserts',
          imageUrl: 'assets/images/brownie.jpg',
          isVeg: false,
          isEgg: true,
          isNonVeg: false,
        ),
        FoodItem(
          id: '8',
          name: 'Ice Cream Sundae',
          description: 'Vanilla ice cream with chocolate sauce and nuts',
          price: 169.0,
          originalPrice: 199.0,
          categoryId: 'desserts',
          imageUrl: 'assets/images/sundae.jpg',
          isVeg: true,
          isEgg: false,
          isNonVeg: false,
          isAvailable: false,
        ),
      ],
    ),
  ];

  Future<List<FoodItemCategory>> getFoodItems() async {
    return _foodCategories;
  }

  Future<List<FoodItem>> getFoodItemsByCategory(String categoryId) async {
    final category = _foodCategories.firstWhere(
      (cat) =>
          cat.foodItems?.any((item) => item.categoryId == categoryId) ?? false,
      orElse: () => FoodItemCategory(name: '', foodItems: []),
    );
    return category.foodItems ?? [];
  }

  Future<void> addFoodItem(FoodItem foodItem) async {
    final categoryIndex = _foodCategories.indexWhere(
      (cat) =>
          cat.foodItems
              ?.any((item) => item.categoryId == foodItem.categoryId) ??
          false,
    );
    if (categoryIndex != -1) {
      final category = _foodCategories[categoryIndex];
      final updatedItems = [...?category.foodItems, foodItem];
      _foodCategories[categoryIndex] = FoodItemCategory(
        name: category.name,
        foodItems: updatedItems,
      );
    }
  }

  Future<void> updateFoodItem(FoodItem foodItem) async {
    for (var i = 0; i < _foodCategories.length; i++) {
      final category = _foodCategories[i];
      final itemIndex =
          category.foodItems?.indexWhere((item) => item.id == foodItem.id) ??
              -1;
      if (itemIndex != -1) {
        final updatedItems = [...?category.foodItems];
        updatedItems[itemIndex] = foodItem;
        _foodCategories[i] = FoodItemCategory(
          name: category.name,
          foodItems: updatedItems,
        );
        break;
      }
    }
  }

  Future<void> deleteFoodItem(String id) async {
    for (var i = 0; i < _foodCategories.length; i++) {
      final category = _foodCategories[i];
      if (category.foodItems?.any((item) => item.id == id) ?? false) {
        final updatedItems =
            category.foodItems?.where((item) => item.id != id).toList();
        _foodCategories[i] = FoodItemCategory(
          name: category.name,
          foodItems: updatedItems,
        );
        break;
      }
    }
  }

  Future<void> toggleFoodItemAvailability(String id) async {
    for (var i = 0; i < _foodCategories.length; i++) {
      final category = _foodCategories[i];
      final itemIndex =
          category.foodItems?.indexWhere((item) => item.id == id) ?? -1;
      if (itemIndex != -1) {
        final item = category.foodItems![itemIndex];
        final updatedItems = [...?category.foodItems];
        updatedItems[itemIndex] = item.copyWith(isAvailable: !item.isAvailable);
        _foodCategories[i] = FoodItemCategory(
          name: category.name,
          foodItems: updatedItems,
        );
        break;
      }
    }
  }

  Future<List<FoodItemCategory>> getFoodItemsByType(FoodType type) async {
    if (type == FoodType.all) {
      return _foodCategories;
    }

    return _foodCategories
        .map((category) {
          final filteredItems = category.foodItems?.where((item) {
            switch (type) {
              case FoodType.veg:
                return item.isVeg;
              case FoodType.egg:
                return item.isEgg;
              case FoodType.nonVeg:
                return item.isNonVeg;
              default:
                return true;
            }
          }).toList();

          return FoodItemCategory(
            name: category.name,
            foodItems: filteredItems,
          );
        })
        .where((category) =>
            category.foodItems != null && category.foodItems!.isNotEmpty)
        .toList();
  }
}
