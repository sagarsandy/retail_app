import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/features/food/common/model/cafe.dart';
import 'package:retail_app/features/food/favourite/presentation/domain/use_case/favourite_use_case.dart';

import '../../../common/enums/favourite_type.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouritesState> {
  final FavouriteUseCase favouriteUseCase;

  List<Cafe> favouriteCafes = [];
  List<String> favouriteCafeIds = [];

  FavouriteCubit(
    this.favouriteUseCase,
  ) : super(FavouritesInitialState());

  void addToFavourites(Cafe cafe) async {
    updateFavourites(cafe: cafe, type: FavouriteUpdateType.add);
  }

  void removeFromFavourites(Cafe cafe) async {
    updateFavourites(cafe: cafe, type: FavouriteUpdateType.remove);
  }

  void getFavourites() async {
    emit(FavouritesLoadingState());
    try {
      if (favouriteCafes.isNotEmpty && favouriteCafeIds.isNotEmpty) {
        emit(FavouritesLoadedState(favouriteCafes: favouriteCafes));
        return;
      }
      final favourites = await favouriteUseCase.getFavourites();
      favouriteCafes = favourites;
      favouriteCafeIds = favourites.map((cafe) => cafe.id).toList();
      emit(FavouritesLoadedState(favouriteCafes: favouriteCafes));
    } catch (e) {
      emit(FavouritesErrorState(e.toString()));
    }
  }

  void updateFavourites({
    required Cafe cafe,
    required FavouriteUpdateType type,
  }) async {
    emit(FavouritesLoadingState());
    try {
      switch (type) {
        case FavouriteUpdateType.add:
          favouriteCafes.add(cafe);
          favouriteCafeIds.add(cafe.id);
          break;
        case FavouriteUpdateType.remove:
          favouriteCafes.remove(cafe);
          favouriteCafeIds.remove(cafe.id);
          break;
      }
      emit(FavouritesLoadedState(favouriteCafes: favouriteCafes));
    } catch (e) {
      emit(FavouritesErrorState(e.toString()));
    }
  }
}
