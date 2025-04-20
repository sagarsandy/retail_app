import 'package:go_router/go_router.dart';
import 'package:retail_app/check/tab_page_route.dart';
import 'package:retail_app/features/food/cart/router/cart_page_route.dart';
import 'package:retail_app/features/food/favourite/router/favourite_page_route.dart';
import 'package:retail_app/features/food/home/router/home_page_route.dart';
import 'package:retail_app/features/food/menu/router/menu_page_route.dart';
import 'package:retail_app/features/food/orders/router/orders_page_route.dart';
import 'package:retail_app/features/login/router/login_page_route.dart';

import '../../features/food/cafe_details/router/cafe_details_page_route.dart';
import 'ss_app_router.dart';

class SSRouteInitializer {
  static final SSRouteInitializer _singleton = SSRouteInitializer._internal();

  factory SSRouteInitializer() {
    return _singleton;
  }

  SSRouteInitializer._internal();

  List<RouteBase> allRoutes() {
    return [
      LoginPageRoute(rootNavigatorKey).getRoute(),
      HomePageRoute(rootNavigatorKey).getRoute(),
      CafeDetailsPageRoute(rootNavigatorKey).getRoute(),
      FavouritePageRoute(rootNavigatorKey).getRoute(),
      CartPageRoute(rootNavigatorKey).getRoute(),
      OrdersPageRoute(rootNavigatorKey).getRoute(),
      MenuPageRoute(rootNavigatorKey).getRoute(),
      Test1PageRoute(rootNavigatorKey).getRoute(),
      Test2PageRoute(rootNavigatorKey).getRoute(),
      Test3PageRoute(rootNavigatorKey).getRoute(),
      Test4PageRoute(rootNavigatorKey).getRoute(),
      Test5PageRoute(rootNavigatorKey).getRoute(),
    ];
  }
}
