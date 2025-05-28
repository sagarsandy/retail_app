abstract class SSRouteInfo {
  final String path;
  final String name;

  String get navigationPath => path.startsWith('/') ? path : '/$path';

  SSRouteInfo(this.path, this.name);
}

enum SSAppRoutes implements SSRouteInfo {
  // Auth
  login('login', 'login'),
  addCafe('addCafe', 'addCafe'),
  home('home', 'home'),
  categories('categories', 'categories');

  @override
  final String path;

  @override
  final String name;

  @override
  String get navigationPath => path[0] == '/' ? path : '/$path';

  const SSAppRoutes(this.path, this.name);
}
