import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/nft_marketplace/presentation/pages/nft_marketplace_page.dart';
import '../features/tables/presentation/pages/tables_page.dart';
import '../features/kanban/presentation/pages/kanban_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/dashboard/presentation/widgets/sidebar.dart';
import '../core/utils/responsive.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter get router => _router;

  static final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: '/dashboard',
                name: 'dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/nft-marketplace',
                name: 'nft-marketplace',
                builder: (context, state) => const NftMarketplacePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/tables',
                name: 'tables',
                builder: (context, state) => const TablesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/kanban',
                name: 'kanban',
                builder: (context, state) => const KanbanPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class ScaffoldWithNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavigation({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (!Responsive.isMobile(context))
            SizedBox(
              width: context.responsive(
                mobile: 250,
                desktop: 270,
              ),
              child: Sidebar(
                navigationShell: navigationShell,
              ),
            ),
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
      drawer: Responsive.isMobile(context)
          ? Drawer(
              child: Sidebar(
                navigationShell: navigationShell,
              ),
            )
          : null,
    );
  }
}