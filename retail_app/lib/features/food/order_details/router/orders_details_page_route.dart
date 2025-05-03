import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/features/food/order_details/presentation/pages/order_details_page.dart';
import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../../../../core/presentation/pages/ss_base_widget.dart';

class OrderDetailsPageRoute extends SSPageRoute {
  const OrderDetailsPageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.cafeOrderDetails.name,
        path: SSAppRoutes.cafeOrderDetails.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          CafeOrder? order;
          final extraMap = state.extra as Map<String, Object?>;
          if (extraMap.containsKey('cafeOrder')) {
            order = extraMap['cafeOrder'] as CafeOrder;
          }
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: SSBaseWidget(
              title: "Food Order Details Page",
              page: OrderDetailsPage(order: order),
            ),
          );
        },
      );
}
