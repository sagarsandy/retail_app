import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';
import '../presentation/pages/reviews_page.dart';

class ReviewsPageRouter extends SSPageRoute {
  const ReviewsPageRouter(super.parentNavigatorKey);
  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.reviews.name,
        path: SSAppRoutes.reviews.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Reviews",
              page: const ReviewsPage(),
            ),
          );
        },
      );
}
