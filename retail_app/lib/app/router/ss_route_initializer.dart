import 'package:go_router/go_router.dart';
import 'package:retail_app/features/food/cart/router/cart_page_route.dart';
import 'package:retail_app/features/food/favourite/router/favourite_page_route.dart';
import 'package:retail_app/features/food/home/router/home_page_route.dart';
import 'package:retail_app/features/food/menu/router/menu_page_route.dart';
import 'package:retail_app/features/food/order_details/router/orders_details_page_route.dart';
import 'package:retail_app/features/food/orders/router/orders_page_route.dart';
import 'package:retail_app/features/landing/router/landing_page_route.dart';
import 'package:retail_app/features/login/router/login_page_route.dart';
import 'package:retail_app/features/mart/cart/router/cart_m_page_route.dart';
import 'package:retail_app/features/mart/home/router/home_page_m_route.dart';
import 'package:retail_app/features/mart/orders/router/orders_m_page_route.dart';
import 'package:retail_app/features/mart/product/router/product_listing_page_route.dart';
import 'package:retail_app/features/mart/product_detail/router/product_m_detail_page_route.dart';

import '../../features/food/cafe_details/router/cafe_details_page_route.dart';
import '../../features/otp/router/otp_page_route.dart';
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
      OTPPageRoute(rootNavigatorKey).getRoute(),
      LandingPageRoute(rootNavigatorKey).getRoute(),
      HomePageRoute(rootNavigatorKey).getRoute(),
      CafeDetailsPageRoute(rootNavigatorKey).getRoute(),
      FavouritePageRoute(rootNavigatorKey).getRoute(),
      CartPageRoute(rootNavigatorKey).getRoute(),
      OrdersPageRoute(rootNavigatorKey).getRoute(),
      MenuPageRoute(rootNavigatorKey).getRoute(),
      OrderDetailsPageRoute(rootNavigatorKey).getRoute(),
      HomePageMRoute(rootNavigatorKey).getRoute(),
      ProductListingPageRoute(rootNavigatorKey).getRoute(),
      ProductMDetailPageRoute(rootNavigatorKey).getRoute(),
      CartMPageRoute(rootNavigatorKey).getRoute(),
      OrdersMPageRoute(rootNavigatorKey).getRoute(),
    ];
  }
}
