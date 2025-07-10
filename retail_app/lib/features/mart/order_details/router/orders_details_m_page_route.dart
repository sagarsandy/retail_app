import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/features/mart/order_details/presentation/pages/order_details_m_page.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';

class OrderDetailsPageMRoute extends SSPageRoute {
  const OrderDetailsPageMRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.martOrderDetails.name,
        path: SSAppRoutes.martOrderDetails.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          // CafeOrder? order;
          // final extraMap = state.extra as Map<String, Object?>;
          // if (extraMap.containsKey('cafeOrder')) {
          //   order = extraMap['cafeOrder'] as CafeOrder;
          // }
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Mart Order Details Page",
              page: const OrderDetailsMPage(),
            ),
          );
        },
      );
}
