import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:ud_mobile_app/core/app/router/routes_path_const.dart';
import 'package:ud_mobile_app/features/main/presentation/home_screen.dart';

part 'app_routes.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  // final AuthService authService;

  // AppRouter(this.authService);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: RoutesPaths.main,
          initial: true,
        ),

        // AutoRoute(
        //   initial: true,
        //   path: RoutesPaths.main,
        //   page: BottomNavRoute.page,
        //   guards: [
        //     AuthGuard(authService: authService),
        //   ],
        //   children: [
        //     AutoRoute(
        //       page: SearchRoute.page,
        //       maintainState: false,
        //     ),
        //     OrdersRoutes.routes,
        //     MessagesRoutes.routes,
        //     ProfileRoutes.routes,
        //   ],
        // ),
      ];
}

class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({super.key});
}
