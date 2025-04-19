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
  foodDetails('foodDetails', 'foodDetails'),
  foodFavourite('foodFavourite', 'foodFavorite'),
  foodCart('foodCart', 'foodCart'),
  foodOrders('foodOrders', 'foodOrders'),
  foodMenu('foodMenu', 'foodMenu'),
  signUp('signup', 'signup');

  @override
  final String path;

  @override
  final String name;

  @override
  String get navigationPath => path[0] == '/' ? path : '/$path';

  const SSAppRoutes(this.path, this.name);
}
