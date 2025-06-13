import 'package:retail_app/features/mart/home/domain/models/category_test_data.dart';
import 'package:retail_app/features/mart/home/domain/models/mart_category.dart';

class MartCategoriesUseCase {
  MartCategoriesUseCase();

  final CategoryTestData categoryTestData = CategoryTestData();
  List<MartCategory> getMartCategories() {
    return categoryTestData.martCategoriesTestData();
  }
}
