import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/features/food/cafe_details/domain/models/cafe_details.dart';

import 'cafe_cart_state.dart';

class CafeCartCubit extends Cubit<CafeCartState> {
  CafeCartCubit() : super(CafeCartInitialState());

  List<CafeItem> cafeCartItems = [];

  void addToCart(CafeItem item) {
    if (cafeCartItems.isEmpty) {
      cafeCartItems.add(item);
    } else {
      if (cafeCartItems.first.cafeId == item.cafeId) {
        cafeCartItems.add(item);
      } else {
        emit(
          CafeCartErrorState(
            uniqueId: Random().nextInt(1000000).toString(),
            message: "You can only add items from one cafe at a time",
          ),
        );
        return;
      }
    }
    emit(CafeCartLoadedState(cafeCartItems: cafeCartItems));
  }

  void removeFromCart(CafeItem item) {
    cafeCartItems.remove(item);
    emit(CafeCartLoadedState(cafeCartItems: cafeCartItems));
  }

  void clearCart() {
    cafeCartItems.clear();
    emit(CafeCartLoadedState(cafeCartItems: cafeCartItems));
  }
}
