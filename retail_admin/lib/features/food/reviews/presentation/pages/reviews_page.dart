import 'package:flutter/material.dart';
import 'package:retail_admin/di/service_locator.dart';
import 'package:retail_admin/features/food/reviews/presentation/cubit/reviews_cubit.dart';

import '../../../../../core/presentation/widgets/admin_sidebar_menu_widget.dart';
import '../widgets/review_list_widget.dart';
import '../widgets/reviews_header_widget.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  final ReviewsCubit _reviewsCubit = locator<ReviewsCubit>();

  @override
  initState() {
    super.initState();
    _reviewsCubit.getReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      drawer: const AdminSideBarMenuWidget(selectedIndex: 6),
      body: const Column(
        children: [
          ReviewsHeaderWidget(),
          Expanded(
            child: ReviewListWidget(),
          ),
        ],
      ),
    );
  }
}
