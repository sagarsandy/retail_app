import 'package:flutter/material.dart';
import 'package:retail_app/features/food/details/presentation/pages/details_page_helper.dart';
import 'package:retail_app/features/food/details/presentation/widgets/body_widget.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';
import '../widgets/favourite_icon_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _showTitle = false;
  final DetailsPageHelper _detailsPageHelper = DetailsPageHelper();

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
        child: const BodyWidget(),
      ),
    );
  }

  bool _handleScrollEvent(ScrollNotification scrollNotification) {
    bool showTitle =
        _detailsPageHelper.showAppBarTitle(scrollNotification, _showTitle);
    setState(() {
      _showTitle = showTitle;
    });
    return false;
  }
}
