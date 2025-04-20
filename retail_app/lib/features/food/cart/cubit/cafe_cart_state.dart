import 'package:retail_app/features/food/cafe_details/domain/models/cafe_details.dart';

abstract class CafeCartState {
  const CafeCartState();
}

class CafeCartInitialState extends CafeCartState {}

class CafeCartLoadingState extends CafeCartState {}

class CafeCartLoadedState extends CafeCartState {
  final List<CafeItem> cafeCartItems;

  const CafeCartLoadedState({required this.cafeCartItems});
}

class CafeCartErrorState extends CafeCartState {
  final String message;
  final String uniqueId;

  const CafeCartErrorState({required this.uniqueId, required this.message});
}
