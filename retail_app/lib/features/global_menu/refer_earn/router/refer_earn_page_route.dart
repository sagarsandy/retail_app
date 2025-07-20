import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/core/presentation/pages/ss_base_widget.dart';
import 'package:retail_app/features/global_menu/refer_earn/presentation/refer_earn_page.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';

class ReferEarnPageRoute extends SSPageRoute {
  const ReferEarnPageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.referAndEarn.name,
        path: SSAppRoutes.referAndEarn.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: 'Refer and Earn Page',
              page: const ReferEarnPage(),
            ),
          );
        },
      );
}
