import 'package:autoaid/pages/testing/firstScreen.dart';
import 'package:autoaid/pages/testing/secondScreen.dart';
import 'package:autoaid/routes/router_key_management.dart';
import 'package:go_router/go_router.dart';

class AppPath {
  static const String firstScreen = '/first';
  static const String secondScreen = '/second';


}

class AppRouter {
    static final router = GoRouter(
    initialLocation: AppPath.firstScreen,
    navigatorKey: RouterKeyManager.instance.rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
            path: AppPath.firstScreen,
            builder: (
              context,
              state,
            ) =>
                const FirstScreen()),
      GoRoute(
            path: AppPath.secondScreen,
            builder: (
              context,
              state,
            ) =>
                const SecondScreen()),
    ],
    debugLogDiagnostics: true,
  );
}
