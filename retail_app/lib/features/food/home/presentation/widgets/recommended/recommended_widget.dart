import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/home/cubit/recommended/recommended_cafe_cubit.dart';
import 'package:retail_app/features/food/home/cubit/recommended/recommended_cafe_state.dart';
import 'package:retail_app/features/food/home/presentation/widgets/recommended/recommended_list_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/title_widget.dart';

class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({super.key});

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  final RecommendedCafeCubit recommendedCafeCubit =
      locator<RecommendedCafeCubit>();

  @override
  void initState() {
    recommendedCafeCubit.getRecommendedCafes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: recommendedCafeCubit,
        builder: (context, state) {
          if (state is RecommendedCafeLoadedState) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  height: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(title: 'Recommended for you'),
                      const SizedBox(height: 10),
                      Expanded(
                        child: RecommendedListWidget(
                          cafes: state.recommendedCafes,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: SizedBox.shrink(),
            ),
          );
        });
  }
}
