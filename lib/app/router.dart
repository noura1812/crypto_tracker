import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main_layer/main_layer_page.dart';
import '../splash/splash_page.dart';

import '../core/config/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: Routes.splashPage,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: Routes.splashPage,
      name: Routes.splashPage,
      pageBuilder:
          (BuildContext context, GoRouterState state) =>
              MaterialPage<void>(key: state.pageKey, child: const SplashPage()),
    ),

    GoRoute(
      path: Routes.mainLayer,
      name: Routes.mainLayer,
      pageBuilder:
          (BuildContext context, GoRouterState state) => MaterialPage<void>(
            key: state.pageKey,
            child: const MainLayerPage(),
          ),
    ),
  ],
);
