import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/core/presentation/widgets/ss_button_widget.dart';
import 'package:retail_app/core/presentation/widgets/ss_toast.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/cart/cubit/cafe_cart_cubit.dart';
import 'package:retail_app/features/food/cart/cubit/cafe_cart_state.dart';

class CafeCartWidget extends StatefulWidget {
  const CafeCartWidget({super.key});

  @override
  State<CafeCartWidget> createState() => _CafeCartWidgetState();
}

class _CafeCartWidgetState extends State<CafeCartWidget> {
  final CafeCartCubit _cafeCartCubit = locator<CafeCartCubit>();
  int _cafeCartItemCount = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: _cafeCartCubit,
        listener: (context, state) {
          if (state is CafeCartErrorState) {
            showCustomToast(context, state.message, ToastType.error);
          }
        },
        builder: (context, state) {
          if (state is CafeCartLoadedState) {
            _cafeCartItemCount = state.cafeCartItems.length;
          }
          return Visibility(
            visible: _cafeCartItemCount > 0,
            replacement: const SizedBox.shrink(),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: SSButtonWidget(
                  title: "View Cart ($_cafeCartItemCount)",
                  onTap: () {},
                ),
              ),
            ),
          );
        });
  }
}
