// import 'package:auto_route/auto_route.dart';
// import 'package:spec_client_app/core/app/router/routes_path_const.dart';
// import 'package:spec_client_app/core/services/auth_service.dart';

// class AuthGuard extends AutoRouteGuard {
//   final AuthService authService;

//   AuthGuard({required this.authService});

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (authService.cachedUser?.access_token != null) {
//       resolver.next(true);
//     } else {
//       router.pushNamed(RoutesPaths.choosePath);
//     }
//   }
// }
