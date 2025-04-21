import 'package:retail_app/features/food/common/model/cafe.dart';
import 'package:retail_app/features/food/common/model/food_category.dart';

class HomeTestData {
  List<Cafe> cafeData() {
    final Cafe cafe1 = Cafe(
      id: "vj_1",
      name: "Silver Dum Biryani",
      address: "Panta kaluva road, Vijayawada",
      deliveryTime: "20-30mnts",
      openTime: "10am",
      closeTime: "10pm",
      category: 'Biryani',
      imageUrl:
          "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    );
    return [cafe1, cafe1, cafe1, cafe1, cafe1, cafe1, cafe1, cafe1];
  }

  List<FoodCategory> foodCategoryData() {
    return [
      FoodCategory(
        id: '1',
        name: 'Pizza',
        imageUrl:
            'https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg',
      ),
      FoodCategory(
        id: '2',
        name: 'Burger',
        imageUrl:
            'https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg',
      ),
      FoodCategory(
        id: '3',
        name: 'Sushi',
        imageUrl:
            'https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg',
      ),
      FoodCategory(
        id: '4',
        name: 'Biryani',
        imageUrl:
            'https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg',
      ),
      FoodCategory(
        id: '5',
        name: 'Dosa',
        imageUrl:
            'https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg',
      ),
      FoodCategory(
        id: '6',
        name: 'Idly',
        imageUrl:
            'https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg',
      ),
      FoodCategory(
        id: '7',
        name: 'Chinese',
        imageUrl:
            'https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg',
      ),
    ];
  }
}
