enum FoodType {
  all,
  veg,
  egg,
  nonVeg,
}

extension FoodTypeString on FoodType {
  String get title {
    switch (this) {
      case FoodType.all:
        return 'All';
      case FoodType.veg:
        return 'Veg';
      case FoodType.nonVeg:
        return 'Non-veg';
      case FoodType.egg:
        return 'Egg';
    }
  }
}
