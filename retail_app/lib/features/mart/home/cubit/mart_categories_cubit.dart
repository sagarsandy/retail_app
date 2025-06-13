import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/features/mart/home/domain/use_case/mart_categories_use_case.dart';

import '../domain/models/mart_category.dart';
import 'mart_categories_state.dart';

class MartCategoriesCubit extends Cubit<MartCategoriesState> {
  final MartCategoriesUseCase martCategoriesUseCase;
  MartCategoriesCubit(this.martCategoriesUseCase)
      : super(const MartCategoriesInitialState());

  Future<void> getMartCategories() async {
    emit(const MartCategoriesLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final List<MartCategory> martCategories =
          martCategoriesUseCase.getMartCategories();
      emit(MartCategoriesLoadedState(martCategories: martCategories));
    } catch (e) {
      emit(MartCategoriesErrorState(e.toString()));
    }
  }
}
