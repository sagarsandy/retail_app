import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/cafe_details/cubit/cafe_details_cubit.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';
import '../../../../../core/presentation/widgets/ss_page_loader_widget.dart';
import '../../cubit/cafe_details_state.dart';
import '../widgets/cafe_body_widget.dart';
import '../widgets/favourite_icon_widget.dart';
import 'cafe_details_page_helper.dart';

class CafeDetailsPage extends StatefulWidget {
  const CafeDetailsPage({super.key});

  @override
  State<CafeDetailsPage> createState() => _CafeDetailsPageState();
}

class _CafeDetailsPageState extends State<CafeDetailsPage> {
  bool _showTitle = false;
  final CafeDetailsPageHelper _detailsPageHelper = CafeDetailsPageHelper();
  final CafeDetailsCubit _cafeDetailsCubit = locator<CafeDetailsCubit>();

  @override
  initState() {
    super.initState();
    _showTitle = true;
    _cafeDetailsCubit.fetchCafeDetails("vj_1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.white,
      appBar: SSAppBarWidget(
        showTitle: _showTitle,
        title: "Silver Dum Biryani",
        trailingWidget: const FavouriteIconWidget(),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          return _handleScrollEvent(scrollNotification);
        },
        child: BlocBuilder(
          bloc: _cafeDetailsCubit,
          builder: (context, state) {
            switch (state) {
              case CafeDetailsErrorState():
                return const Center(child: Text("Error"));
              case CafeDetailsLoadedState():
                _showTitle = false;
                return CafeBodyWidget(
                  cafeDetails: state.cafeDetails,
                  onFilterSelected: (List<String> selectedFilters) {
                    _cafeDetailsCubit.filterCafeItems(selectedFilters);
                  },
                );
              case CafeDetailsLoadingState():
              default:
                return const SSPageLoaderWidget();
            }
          },
        ),
      ),
    );
  }

  bool _handleScrollEvent(ScrollNotification scrollNotification) {
    bool showTitle =
        _detailsPageHelper.showAppBarTitle(scrollNotification, _showTitle);
    // setState(() {
    //   _showTitle = showTitle;
    // });
    return false;
  }
}
