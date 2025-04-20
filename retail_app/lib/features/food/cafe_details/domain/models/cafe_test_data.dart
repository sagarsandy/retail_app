import 'package:retail_app/features/food/cafe_details/domain/models/cafe_details.dart';

class CafeTestData {
  final CafeCoupon cafeCoupon1 = CafeCoupon(
    id: "vj_1",
    couponCode: "SUMMER50",
    couponDescription: "Get 50% off on your first order",
    couponTitle: "50% off on All Items",
  );

  final CafeItem cafeBreadItem1 = CafeItem(
    name: "Garlic Bread",
    description: "Delicious garlic bread with cheese",
    price: 100.0,
    originalPrice: 120.0,
    imageUrl:
        "https://media.cnn.com/api/v1/images/stellar/prod/140430115517-06-comfort-foods.jpg",
    isVeg: true,
    isNonVeg: false,
    isEgg: false,
    cafeId: 'vj_1',
    id: 'vj_1_bread_1',
  );

  final CafeItem cafeBreadItem2 = CafeItem(
    cafeId: 'vj_1',
    id: 'vj_1_bread_2',
    name: "Cheese Bread",
    description: "Delicious cheese bread with herbs",
    price: 120.0,
    originalPrice: 150.0,
    imageUrl:
        "https://images.immediate.co.uk/production/volatile/sites/30/2024/02/Green-goddess-avocado-salad-a1d9a85.jpg",
    isVeg: false,
    isNonVeg: false,
    isEgg: true,
  );

  final CafeItem cafeDessertItem1 = CafeItem(
    cafeId: 'vj_1',
    id: 'vj_1_cake_1',
    name: "Chocolate Cake",
    description: "Delicious chocolate cake with cream",
    price: 250.0,
    originalPrice: 300.0,
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    isVeg: false,
    isNonVeg: false,
    isEgg: true,
  );

  final CafeItem cafeDessertItem2 = CafeItem(
    cafeId: 'vj_1',
    id: 'vj_1_cake_2',
    name: "Vanilla Ice Cream",
    description: "Creamy vanilla ice cream",
    price: 100.0,
    originalPrice: 120.0,
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    isVeg: true,
    isNonVeg: false,
    isEgg: false,
  );

  final CafeItem cafeChineseItem1 = CafeItem(
    cafeId: 'vj_1',
    id: 'vj_1_chinese_1',
    name: "Chicken Fried Rice",
    description: "Delicious chicken fried rice with spices",
    price: 150.0,
    originalPrice: 200.0,
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    isVeg: false,
    isNonVeg: true,
    isEgg: false,
  );

  final CafeItem cafeChineseItem2 = CafeItem(
    cafeId: 'vj_1',
    id: 'vj_1_chinese_2',
    name: "Veg Fried Rice",
    description: "Delicious veg fried rice with spices",
    price: 120.0,
    originalPrice: 150.0,
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    isVeg: true,
    isNonVeg: false,
    isEgg: false,
  );

  final CafeItem cafeChineseItem3 = CafeItem(
    cafeId: 'vj_2',
    id: 'vj_1_chinese_3',
    name: "Egg Fried Rice",
    description: "Delicious egg fried rice with spices",
    price: 130.0,
    originalPrice: 160.0,
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    isVeg: false,
    isNonVeg: false,
    isEgg: true,
  );

  final CafeItem cafeBiryaniItem1 = CafeItem(
    cafeId: 'vj_1',
    id: 'vj_1_biryani_1',
    name: "Chicken Biryani",
    description: "Delicious chicken biryani with spices",
    price: 200.0,
    originalPrice: 250.0,
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    isVeg: false,
    isNonVeg: true,
    isEgg: false,
  );

  final CafeItem cafeBiryaniItem2 = CafeItem(
    cafeId: 'vj_1',
    id: 'vj_1_biryani_2',
    name: "Veg Biryani",
    description: "Delicious veg biryani with spices",
    price: 150.0,
    originalPrice: 200.0,
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    isVeg: true,
    isNonVeg: false,
    isEgg: false,
  );

  final CafeItem cafeBiryaniItem3 = CafeItem(
    cafeId: 'vj_2',
    id: 'vj_1_biryani_3',
    name: "Egg Biryani",
    description: "Delicious egg biryani with spices",
    price: 180.0,
    originalPrice: 220.0,
    imageUrl:
        "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg",
    isVeg: false,
    isNonVeg: false,
    isEgg: true,
  );

  CafeDetails cafeDetailsData() {
    final CafeItemCategory cafeBiryaniCategory = CafeItemCategory(
      name: "Biryani",
      cafeItems: [cafeBiryaniItem1, cafeBiryaniItem2, cafeBiryaniItem3],
    );

    final CafeItemCategory cafeChineseCategory = CafeItemCategory(
      name: "Chinese",
      cafeItems: [cafeChineseItem1, cafeChineseItem2, cafeChineseItem3],
    );

    final CafeItemCategory cafeDessertCategory = CafeItemCategory(
      name: "Desserts",
      cafeItems: [cafeDessertItem1, cafeDessertItem2],
    );

    final CafeItemCategory cafeBreadCategory = CafeItemCategory(
      name: "Bread",
      cafeItems: [cafeBreadItem1, cafeBreadItem2],
    );

    final List<CafeItemCategory> cafeCategories = [
      cafeBreadCategory,
      cafeBiryaniCategory,
      cafeChineseCategory,
      cafeDessertCategory,
    ];

    final CafeDetails cafeDetails = CafeDetails(
      id: "vj_1",
      name: "Silver Sum Biryani",
      address: "Panta kaluva road, Vijayawada",
      deliveryTime: "20-30mnts",
      openTime: "10am",
      closeTime: "10pm",
      cafeItemCategories: cafeCategories,
      cafeCoupons: [cafeCoupon1],
    );

    return cafeDetails;
  }
}
