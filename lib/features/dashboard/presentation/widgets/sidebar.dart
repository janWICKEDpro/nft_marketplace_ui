import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class Sidebar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const Sidebar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          right: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child:
                isDark
                    ? Image.asset(
                      "assets/icons/logo_dark.png",
                      height: 26,
                      width: 181,
                    )
                    : Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.dashboard_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'HORIZON FREE',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
          ),
          Divider(
            color:
                isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : AppColors.divider,
          ),
          Expanded(
            child: ListView(
              // padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _SidebarItem(
                  icon: "assets/icons/ic_home_${isDark ? "dark" : "light"}.png",
                  title: 'Dashboard',
                  isSelected: navigationShell.currentIndex == 0,
                  onTap: () => _onTap(context, 0),
                ),
                _SidebarItem(
                  icon:
                      "assets/icons/ic_marketplace_${isDark ? "dark" : "light"}.png",
                  title: 'NFT Marketplace',
                  isSelected: navigationShell.currentIndex == 1,
                  onTap: () => _onTap(context, 1),
                ),
                _SidebarItem(
                  icon:
                      "assets/icons/ic_tables_${isDark ? "dark" : "light"}.png",
                  title: 'Tables',
                  isSelected: navigationShell.currentIndex == 2,
                  onTap: () => _onTap(context, 2),
                ),
                _SidebarItem(
                  icon: "assets/icons/ic_kanban${isDark ? "" : "_light"}.png",
                  title: 'Kanban',
                  isSelected: navigationShell.currentIndex == 3,
                  onTap: () => _onTap(context, 3),
                ),
                _SidebarItem(
                  icon:
                      "assets/icons/ic_profile_${isDark ? "dark" : "light"}.png",
                  title: 'Profile',
                  isSelected: navigationShell.currentIndex == 4,
                  onTap: () => _onTap(context, 4),
                ),
                _SidebarItem(
                  icon:
                      "assets/icons/ic_signin_${isDark ? "dark" : "light"}.png",
                  title: 'Sign In',
                  isSelected: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Image.asset("assets/icons/ic_getpro.png", width: 228, height: 190),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }
}

class _SidebarItem extends StatelessWidget {
  //final IconData icon;
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      //margin: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.only(
              left: 16,
              top: isSelected ? 8 : 12,
              bottom: isSelected ? 8 : 12,
              right: 0,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Image.asset(icon, height: 18, width: 18),
                // Icon(
                //   icon,
                //   size: 20,
                //   color:
                //       isSelected
                //           ? AppColors.primary
                //           : (isDark
                //               ? AppColors.darkTextSecondary
                //               : AppColors.textSecondary),
                // ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color:
                        isSelected
                            ? AppColors.primary
                            : (isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.textPrimary),
                  ),
                ),

                Spacer(),
                isSelected
                    ? Container(
                      height: 36,
                      width: 4,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
