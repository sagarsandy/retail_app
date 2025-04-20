import '../domain/models/cafe_details.dart';

abstract class CafeDetailsState {
  const CafeDetailsState();
}

class CafeDetailsInitialState extends CafeDetailsState {}

class CafeDetailsLoadingState extends CafeDetailsState {}

class CafeDetailsLoadedState extends CafeDetailsState {
  final CafeDetails cafeDetails;

  const CafeDetailsLoadedState({required this.cafeDetails});
}

class CafeDetailsErrorState extends CafeDetailsState {
  final String message;

  const CafeDetailsErrorState({required this.message});
}
