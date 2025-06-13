import 'package:retail_app/features/mart/home/domain/models/primary_category.dart';

class MartCategory {
  final String id;
  final String name;
  final List<PrimaryCategory> primaryCategories;

  MartCategory({
    required this.id,
    required this.name,
    required this.primaryCategories,
  });
}
