import 'package:retail_app/features/mart/home/domain/models/mart_category.dart';

abstract class MartCategoriesState {
  const MartCategoriesState();
}

class MartCategoriesInitialState extends MartCategoriesState {
  const MartCategoriesInitialState();
}

class MartCategoriesLoadingState extends MartCategoriesState {
  const MartCategoriesLoadingState();
}

class MartCategoriesLoadedState extends MartCategoriesState {
  final List<MartCategory> martCategories;

  const MartCategoriesLoadedState({required this.martCategories});
}

class MartCategoriesErrorState extends MartCategoriesState {
  final String error;

  const MartCategoriesErrorState(this.error);
}
