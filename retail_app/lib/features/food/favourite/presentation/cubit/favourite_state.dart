import '../../../common/model/cafe.dart';

abstract class FavouritesState {}

class FavouritesInitialState extends FavouritesState {}

class FavouritesLoadingState extends FavouritesState {}

class FavouritesLoadedState extends FavouritesState {
  final List<Cafe> favouriteCafes;

  FavouritesLoadedState({required this.favouriteCafes});
}

class FavouritesErrorState extends FavouritesState {
  final String error;

  FavouritesErrorState(this.error);
}
