class AppRoute {
  final String name;
  final String path;
  const AppRoute({required this.name, required this.path});
}

class Routes {
  static const home = AppRoute(name: 'home', path: '/');
  static const info = AppRoute(name: 'info', path: '/info');
  static const profile = AppRoute(name: 'profile', path: '/profile');
  static const contactDetails = AppRoute(
    name: 'contact_details',
    path: '/contact_details',
  );
  static const contactForm = AppRoute(
    name: 'contact_form',
    path: '/contact_form',
  );
  
}
