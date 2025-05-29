class FoodCategory {
  final String id;
  final String name;

  const FoodCategory({
    required this.id,
    required this.name,
  });

  static List<FoodCategory> getDummyCategories() {
    return [
      const FoodCategory(id: 'breads', name: 'Breads & Buns'),
      const FoodCategory(id: 'biryani', name: 'Biryani'),
      const FoodCategory(id: 'chinese', name: 'Chinese'),
      const FoodCategory(id: 'desserts', name: 'Desserts & Ice Cream'),
      const FoodCategory(id: 'beverages', name: 'Beverages'),
      const FoodCategory(id: 'starters', name: 'Starters'),
      const FoodCategory(id: 'main_course', name: 'Main Course'),
    ];
  }
}
