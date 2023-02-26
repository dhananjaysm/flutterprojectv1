import 'package:mileazofltr/routes/named_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mileazofltr/screens/book-service/book_service_screen.dart';
import 'package:mileazofltr/screens/login/login_screen.dart';
import 'package:mileazofltr/screens/profile/subscreens/account_settings_screen.dart';
import 'package:mileazofltr/screens/profile/subscreens/personal_details_screen.dart';
import 'package:mileazofltr/screens/services/services_root_screen.dart';
import 'package:mileazofltr/screens/booking-history/booking_history_screen.dart';
import 'package:mileazofltr/screens/home/home_root_screen.dart';
import 'package:mileazofltr/screens/error/route_error_screen.dart';
import 'package:mileazofltr/screens/location/select_location_screen.dart';
import 'package:mileazofltr/screens/offers/offers_screen.dart';
import 'package:mileazofltr/screens/profile/profile_screen.dart';
import 'package:mileazofltr/screens/test-screen/test_screen.dart';
import 'package:mileazofltr/screens/vehicles/add_vehicle_screen.dart';
import 'package:mileazofltr/screens/vehicles/vehicles_screen.dart';
import 'package:mileazofltr/screens/settings/settings_screen.dart';
import 'package:mileazofltr/screens/splash/splash_screen.dart';
import 'package:mileazofltr/screens/vehicle-detail/vehicle_detail_screen.dart';
import 'package:mileazofltr/services/authentication.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: _rootNavigator,
      initialLocation: '/login',
      errorBuilder: (context, state) => RouteErrorScreen(
            errorMsg: state.error.toString(),
            key: state.pageKey,
          ),
      routes: <RouteBase>[
        GoRoute(
          path: '/login',
          name: login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/splash',
          name: splash,
          builder: (context, state) => SplashScreen(),
        ),

        // Application Shell
        ShellRoute(
            navigatorKey: _shellNavigator,
            //This is scaffoldWithNav
            builder:
                (BuildContext context, GoRouterState state, Widget child) =>
                    HomeRootScreen(child: child),
            routes: <RouteBase>[
              // First screen in bottom nav bar
              GoRoute(
                  path: '/services',
                  name: services,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      child: const ServiceRootScreen(),
                      key: state.pageKey,
                    );
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      parentNavigatorKey: _rootNavigator,
                      path: 'vehicleDetails/:id',
                      name: vehicleDetails,
                      builder: (context, state) {
                        final id = state.params['id'].toString();
                        return VehicleDetailScreen(
                          vehicleId: 100,
                          key: state.pageKey,
                        );
                      },
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigator,
                      path: 'selectLocation',
                      name: selectLocation,
                      builder: (context, state) {
                        return SelectLocationScreen(
                          key: state.pageKey,
                        );
                      },
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigator,
                      path: 'test',
                      name: test,
                      builder: (context, state) {
                        return CounterPage(
                          key: state.pageKey,
                        );
                      },
                    ),
                    GoRoute(
                        path: 'profile',
                        parentNavigatorKey: _rootNavigator,
                        name: profile,
                        pageBuilder: (context, state) =>
                            CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const ProfileScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end);
                                // .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                        routes: [
                          GoRoute(
                            path: 'personalDetails',
                            parentNavigatorKey: _rootNavigator,
                            name: personalDetails,
                            pageBuilder: (context, state) =>
                                CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const PersonalDetails(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end);
                                // .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          ),
                          GoRoute(
                            path: 'accountSettings',
                            parentNavigatorKey: _rootNavigator,
                            name: accountSettings,
                            pageBuilder: (context, state) =>
                                CustomTransitionPage<void>(
                              key: state.pageKey,
                              child: const AccountSettings(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end);
                                // .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          )
                        ]),
                    GoRoute(
                      path: 'bookService',
                      name: bookService,
                      parentNavigatorKey: _rootNavigator,
                      pageBuilder: (context, state) =>
                          CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: const BookService(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end);
                          // .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    ),
                  ]),
              GoRoute(
                path: '/bookingHistory',
                name: bookingHistory,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey, child: const BookingHistoryScreen());
                },
              ),
              GoRoute(
                  path: '/vehicles',
                  name: vehicles,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        key: state.pageKey, child: const VehiclesScreen());
                  },
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigator,
                      path: 'addVehicle',
                      name: addVehicle,
                      builder: (context, state) {
                        return AddVehicleScreen(
                          key: state.pageKey,
                        );
                      },
                    ),
                  ]),
              GoRoute(
                path: '/notification',
                name: notification,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      // Change it to notification screen
                      key: state.pageKey,
                      child: const OfferScreen());
                },
              ),
              GoRoute(
                path: '/settings',
                name: settings,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey, child: const SettingScreen());
                },
              )
            ]),
      ]);
});

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
