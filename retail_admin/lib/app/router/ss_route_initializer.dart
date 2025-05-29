import 'package:go_router/go_router.dart';
import 'package:retail_admin/app/router/ss_app_router.dart';
import 'package:retail_admin/features/food/add_cafe/router/add_cafe_page_router.dart';
import 'package:retail_admin/features/food/food_categories/router/food_categories_page_router.dart';
import 'package:retail_admin/features/food/food_items/router/food_items_page_router.dart';
import 'package:retail_admin/features/food/home/router/home_page_router.dart';
import 'package:retail_admin/features/food/login/login_page_router.dart';
import 'package:retail_admin/features/food/manage_food_item/router/manage_food_item_page_router.dart';

class SSRouteInitializer {
  static final SSRouteInitializer _singleton = SSRouteInitializer._internal();

  factory SSRouteInitializer() {
    return _singleton;
  }

  SSRouteInitializer._internal();

  List<RouteBase> allRoutes() {
    return [
      LoginPageRoute(rootNavigatorKey).getRoute(),
      AddCafePageRoute(rootNavigatorKey).getRoute(),
      HomePageRoute(rootNavigatorKey).getRoute(),
      FoodCategoriesPageRoute(rootNavigatorKey).getRoute(),
      FoodItemsPageRouter(rootNavigatorKey).getRoute(),
      ManageFoodItemPageRouter(rootNavigatorKey).getRoute(),
    ];
  }
}
