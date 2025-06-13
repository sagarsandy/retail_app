import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/core/presentation/widgets/ss_circular_loading_widget.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/mart/home/cubit/mart_categories_cubit.dart';
import 'package:retail_app/features/mart/home/cubit/mart_categories_state.dart';
import 'package:retail_app/features/mart/home/presentation/widgets/primary_category_grid_widget.dart';

class PrimaryCategoriesWidget extends StatefulWidget {
  const PrimaryCategoriesWidget({super.key});

  @override
  State<PrimaryCategoriesWidget> createState() =>
      _PrimaryCategoriesWidgetState();
}

class _PrimaryCategoriesWidgetState extends State<PrimaryCategoriesWidget> {
  final MartCategoriesCubit martCategoriesCubit = locator();

  @override
  void initState() {
    super.initState();
    martCategoriesCubit.getMartCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder(
        bloc: martCategoriesCubit,
        builder: (context, state) {
          if (state is MartCategoriesLoadingState) {
            return const SizedBox(
              height: 200,
              child: SSCircularLoadingWidget(),
            );
          }
          if (state is MartCategoriesLoadedState) {
            return ListView.separated(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                return PrimaryCategoryGridWidget(
                  martCategory: state.martCategories[index],
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
