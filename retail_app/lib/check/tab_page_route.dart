import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/check/test_1.dart';
import 'package:retail_app/check/test_2.dart';
import 'package:retail_app/check/test_3.dart';
import 'package:retail_app/check/test_4.dart';
import 'package:retail_app/check/test_5.dart';

import '../../../app/router/ss_app_routes.dart';
import '../../../app/router/ss_page_route.dart';
import '../../../app/router/ss_route_utility.dart';

class Test1PageRoute extends SSPageRoute {
  const Test1PageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.test1.name,
        path: SSAppRoutes.test1.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: const Test1(),
          );
        },
      );
}

class Test2PageRoute extends SSPageRoute {
  const Test2PageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.test2.name,
        path: SSAppRoutes.test2.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: const Test2(),
          );
        },
      );
}

class Test3PageRoute extends SSPageRoute {
  const Test3PageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.test3.name,
        path: SSAppRoutes.test3.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: const Test3(),
          );
        },
      );
}

class Test4PageRoute extends SSPageRoute {
  const Test4PageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.test4.name,
        path: SSAppRoutes.test4.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: const Test4(),
          );
        },
      );
}

class Test5PageRoute extends SSPageRoute {
  const Test5PageRoute(super.parentNavigatorKey);

  @override
  GoRoute getRoute() => GoRoute(
        name: SSAppRoutes.test5.name,
        path: SSAppRoutes.test5.navigationPath,
        parentNavigatorKey: parentNavigatorKey,
        redirect: (context, state) {
          return null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithOutAnimation(
            context: context,
            state: state,
            child: const Test5(),
          );
        },
      );
}
