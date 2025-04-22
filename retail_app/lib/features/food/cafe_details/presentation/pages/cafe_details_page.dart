import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/cafe_details/cubit/cafe_details_cubit.dart';
import 'package:retail_app/features/food/common/model/cafe.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';
import '../../../../../core/presentation/widgets/ss_page_loader_widget.dart';
import '../../../common/utils/widget_utils/favourite_icon_widget.dart';
import '../../cubit/cafe_details_state.dart';
import '../widgets/cafe_body_widget.dart';
import '../widgets/cafe_cart_widget.dart';

class CafeDetailsPage extends StatefulWidget {
  final Cafe? cafe;
  const CafeDetailsPage({super.key, this.cafe});

  @override
  State<CafeDetailsPage> createState() => _CafeDetailsPageState();
}

class _CafeDetailsPageState extends State<CafeDetailsPage> {
  bool _showTitle = false;
  final CafeDetailsCubit _cafeDetailsCubit = locator<CafeDetailsCubit>();

  @override
  initState() {
    super.initState();
    _showTitle = true;
    if (widget.cafe != null) {
      _cafeDetailsCubit.fetchCafeDetails(widget.cafe!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cafe == null) {
      return Scaffold(
        backgroundColor: SSColors.surface,
        appBar: SSAppBarWidget(
          showTitle: _showTitle,
          title: "Cafe not found",
        ),
        body: const Center(child: Text("Cafe not found")),
      );
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CafeCartWidget(),
      backgroundColor: SSColors.surface,
      appBar: SSAppBarWidget(
        showTitle: _showTitle,
        title: widget.cafe!.name,
        trailingWidget: FavouriteIconWidget(
          cafe: widget.cafe!,
        ),
      ),
      body: BlocBuilder(
        bloc: _cafeDetailsCubit,
        builder: (context, state) {
          switch (state) {
            case CafeDetailsErrorState():
              return const Center(child: Text("Cafe not found"));
            case CafeDetailsLoadedState():
              _showTitle = false;
              return CafeBodyWidget(
                cafeDetails: state.cafeDetails,
                onFilterSelected: (String selectedFilter) {
                  _cafeDetailsCubit.filterCafeItems(selectedFilter);
                },
              );
            case CafeDetailsLoadingState():
            default:
              return const SSPageLoaderWidget();
          }
        },
      ),
    );
  }
}
