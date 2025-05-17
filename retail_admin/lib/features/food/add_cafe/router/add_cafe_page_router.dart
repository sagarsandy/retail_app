import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/ss_app_routes.dart';
import '../../../../app/router/ss_page_route.dart';
import '../../../../app/router/ss_route_utility.dart';
import '../presentation/pages/add_cafe_page.dart';

class AddCafePageRoute extends SSPageRoute {
  const AddCafePageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.addCafe.name,
        path: SSAppRoutes.addCafe.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithAnimation(
            context: context,
            state: state,
            child: const AddCafePage(),
            // child: SSBaseWidget(
            //   title: "Add Cafe Page",
            //   page: const CafeHomePage(),
            // ),
          );
        },
      );
}
