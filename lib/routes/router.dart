import 'package:autoaid/pages/book_flow/garage_detail/garage_detail.dart';
import 'package:autoaid/pages/book_flow/garage_page/garage_page.dart';
import 'package:autoaid/pages/home_page/home_page.dart';
import 'package:autoaid/pages/login_page/login_page.dart';
import 'package:autoaid/pages/map/map.dart';
import 'package:autoaid/pages/orders_page/orders_page.dart';
import 'package:autoaid/pages/testing/client_socket.dart';
import 'package:autoaid/pages/testing/firstScreen.dart';
import 'package:autoaid/pages/testing/secondScreen.dart';
import 'package:autoaid/pages/user_page/user_page.dart';
import 'package:autoaid/routes/router_key_management.dart';
import 'package:autoaid/utils/widgets/base_scaffold.dart';
import 'package:go_router/go_router.dart';

class AppPath {
  static const String firstScreen = '/first';
  static const String secondScreen = '/second';

  static const String home = '/home';
  static const String map = '/map';
  static const String login = '/login';
  static const String user = '/user';
  static const String orders = '/orders';
  static const String clientSocket = '/socket';

  //book service flow
  static const String garageInfo = '/garageInfo';
  static const String garageInfoDetail = '/garageInfoDetail';
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppPath.home,
    navigatorKey: RouterKeyManager.instance.rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: AppPath.secondScreen,
          builder: (
            context,
            state,
          ) =>
              const SecondScreen()),
      GoRoute(
          path: AppPath.clientSocket,
          builder: (
            context,
            state,
          ) =>
              const ClientSocket()),
      GoRoute(
          path: AppPath.map,
          builder: (
            context,
            state,
          ) =>
              const MapScreen()),
      GoRoute(
          path: AppPath.login,
          builder: (
            context,
            state,
          ) =>
              const SignInPhonePage()),
      GoRoute(
          path: AppPath.garageInfo,
          builder: (
            context,
            state,
          ) =>
              const GarageInfoPage()),
      GoRoute(
          path: AppPath.garageInfoDetail,
          builder: (
            context,
            state,
          ) =>
              const GarageInfoDetail()),
      // GoRoute(
      //     path: AppPath.home,
      //     builder: (
      //       context,
      //       state,
      //     ) =>
      //         const HomePage()),
      ShellRoute(
        navigatorKey: RouterKeyManager.instance.shellNavigatorKey,
        builder: (context, state, child) {
          return BaseScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: AppPath.home,
            builder: (
              context,
              state,
            ) =>
                const HomePage(),
          ),
          GoRoute(
            path: AppPath.firstScreen,
            builder: (
              context,
              state,
            ) =>
                const FirstScreen(),
          ),
          GoRoute(
              path: AppPath.orders,
              builder: (
                context,
                state,
              ) =>
                  const OrdersPage()),
          GoRoute(
            path: AppPath.user,
            builder: (
              context,
              state,
            ) =>
                const UserPage(),
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
  );
}
