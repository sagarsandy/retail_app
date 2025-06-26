abstract class SSRouteInfo {
  final String path;
  final String name;

  String get navigationPath => path.startsWith('/') ? path : '/$path';

  SSRouteInfo(this.path, this.name);
}

enum SSAppRoutes implements SSRouteInfo {
  // Auth
  login('login', 'login'),
  otp('otp', 'otp'),
  landing('landing', 'landing'),
  foodHome('foodHome', 'foodHome'),
  cafeDetails('cafeDetails', 'cafeDetails'),
  cafeFavourite('cafeFavourite', 'cafeFavourite'),
  cafeCart('cafeCart', 'cafeCart'),
  cafeOrders('cafeOrders', 'cafeOrders'),
  cafeOrderDetails('cafeOrderDetails', 'cafeOrderDetails'),
  cafeOptionsMenu('cafeOptionsMenu', 'cafeOptionsMenu'),
  signUp('signup', 'signup'),
  martHome('martHome', 'martHome'),
  martProductListing('martProductListing', 'martProductListing'),
  martProductDetails('martProductDetails', 'martProductDetails'),
  martCart('martCart', 'martCart');

  @override
  final String path;

  @override
  final String name;

  @override
  String get navigationPath => path[0] == '/' ? path : '/$path';

  const SSAppRoutes(this.path, this.name);
}
