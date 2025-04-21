abstract class SSRouteInfo {
  final String path;
  final String name;

  String get navigationPath => path.startsWith('/') ? path : '/$path';

  SSRouteInfo(this.path, this.name);
}

enum SSAppRoutes implements SSRouteInfo {
  // Auth
  test1('test1', 'test1'),
  test2('test2', 'test2'),
  test3('test3', 'test3'),
  test4('test4', 'test4'),
  test5('test5', 'test5'),
  login('login', 'login'),
  foodHome('foodHome', 'foodHome'),
  cafeDetails('cafeDetails', 'cafeDetails'),
  cafeFavourite('cafeFavourite', 'cafeFavourite'),
  cafeCart('cafeCart', 'cafeCart'),
  cafeOrders('cafeOrders', 'cafeOrders'),
  cafeOptionsMenu('cafeOptionsMenu', 'cafeOptionsMenu'),
  signUp('signup', 'signup');

  @override
  final String path;

  @override
  final String name;

  @override
  String get navigationPath => path[0] == '/' ? path : '/$path';

  const SSAppRoutes(this.path, this.name);
}
