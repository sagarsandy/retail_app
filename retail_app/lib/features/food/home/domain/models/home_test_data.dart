import 'package:retail_app/features/food/common/model/cafe.dart';
import 'package:retail_app/features/food/common/model/food_category.dart';

class HomeTestData {
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
  final Cafe cafe2 = Cafe(
    id: "vj_2",
    name: "Golden Spoon",
    address: "MG Road, Vijayawada",
    deliveryTime: "25-35mnts",
    openTime: "9am",
    closeTime: "11pm",
    category: 'Chinese',
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
  );
  final Cafe cafe3 = Cafe(
    id: "vj_3",
    name: "Spicy Treat",
    address: "Benz Circle, Vijayawada",
    deliveryTime: "15-25mnts",
    openTime: "11am",
    closeTime: "10pm",
    category: 'Indian',
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
  );
  final Cafe cafe4 = Cafe(
    id: "vj_4",
    name: "Tandoori Flames",
    address: "Eluru Road, Vijayawada",
    deliveryTime: "20-30mnts",
    openTime: "12pm",
    closeTime: "11pm",
    category: 'Tandoori',
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
  );
  final Cafe cafe5 = Cafe(
    id: "vj_5",
    name: "Urban Bites",
    address: "Governorpet, Vijayawada",
    deliveryTime: "30-40mnts",
    openTime: "10am",
    closeTime: "9pm",
    category: 'Fast Food',
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
  );
  final Cafe cafe6 = Cafe(
    id: "vj_6",
    name: "Royal Feast",
    address: "Labbipet, Vijayawada",
    deliveryTime: "20-30mnts",
    openTime: "8am",
    closeTime: "10pm",
    category: 'Continental',
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
  );
  final Cafe cafe7 = Cafe(
    id: "vj_7",
    name: "Biryani House",
    address: "Ring Road, Vijayawada",
    deliveryTime: "15-20mnts",
    openTime: "11am",
    closeTime: "11pm",
    category: 'Biryani',
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
  );
  final Cafe cafe8 = Cafe(
    id: "vj_8",
    name: "Cafe Delight",
    address: "Patamata, Vijayawada",
    deliveryTime: "10-15mnts",
    openTime: "7am",
    closeTime: "9pm",
    category: 'Cafe',
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
  );
  final Cafe cafe9 = Cafe(
    id: "vj_9",
    name: "Grill & Chill",
    address: "Bhavanipuram, Vijayawada",
    deliveryTime: "25-30mnts",
    openTime: "12pm",
    closeTime: "12am",
    category: 'Grill',
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
  );
  List<Cafe> cafeData() {
    return [cafe1, cafe2, cafe3, cafe4, cafe5, cafe6, cafe7, cafe8, cafe9];
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

  List<Cafe> favouriteCafesData() {
    return [cafe2, cafe4];
  }
}
