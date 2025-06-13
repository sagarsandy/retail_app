import 'package:retail_app/features/mart/home/domain/models/mart_category.dart';
import 'package:retail_app/features/mart/home/domain/models/primary_category.dart';

class CategoryTestData {
  final primaryCat1 = PrimaryCategory(
    id: "1",
    name: "Vegetables & Fruits",
    imageUrl:
        "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg",
  );

  final primaryCat2 = PrimaryCategory(
    id: "2",
    name: "Atta, Rice & Pulses",
    imageUrl:
        "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg",
  );
  final primaryCat3 = PrimaryCategory(
    id: "3",
    name: "Oils, Ghee & Spices",
    imageUrl:
        "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg",
  );
  final primaryCat4 = PrimaryCategory(
    id: "4",
    name: "Dairy, Bread & Eggs",
    imageUrl:
        "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg",
  );
  final primaryCat5 = PrimaryCategory(
    id: "5",
    name: "Bakery & Biscuits",
    imageUrl:
        "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg",
  );
  final primaryCat6 = PrimaryCategory(
    id: "6",
    name: "Dry Fruits & Nuts",
    imageUrl:
        "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg",
  );
  final primaryCat7 = PrimaryCategory(
    id: "7",
    name: "Chicken, Meat & Fish",
    imageUrl:
        "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg",
  );
  final primaryCat8 = PrimaryCategory(
    id: "8",
    name: "Packaged Foods",
    imageUrl:
        "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg",
  );

  List<MartCategory> martCategoriesTestData() {
    final List<PrimaryCategory> primaryCategories = [
      primaryCat1,
      primaryCat2,
      primaryCat3,
      primaryCat4,
      primaryCat5,
      primaryCat6,
      primaryCat7,
      primaryCat8,
    ];
    return [
      MartCategory(
        id: "1",
        name: "Grocery & Kitchen",
        primaryCategories: primaryCategories,
      ),
      MartCategory(
        id: "2",
        name: "Household Essentials",
        primaryCategories: primaryCategories,
      ),
      MartCategory(
        id: "3",
        name: "Snacks & Beverages",
        primaryCategories: primaryCategories,
      ),
      MartCategory(
        id: "4",
        name: "Personal Care",
        primaryCategories: primaryCategories,
      ),
    ];
  }
}
