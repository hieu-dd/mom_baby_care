class RouterDestination {
  const RouterDestination({required this.route, required this.path});

  final String route;
  final String path;

  static const babySize = RouterDestination(
    route: '/baby_size',
    path: 'baby_size',
  );
  static const babyInfo = RouterDestination(
    route: '/baby_info',
    path: 'baby_info',
  );
  static const wonderWeek = RouterDestination(
    route: '/wonder_week',
    path: 'wonder_week',
  );
}
