import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/check_table_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/total_spent_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/weekly_revenue_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.responsive(mobile: 16, desktop: 24)),
      child: Column(
        children: [
          DashboardStatsGrid(),
          const SizedBox(height: 24),
          MainDashboardGrid(),
          Row(
            children: [
              Text(
                "© 2022 Horizon UI. All Rights Reserved. Made with love by Simmmple!",
              ),
              Spacer(),
              TextButton(onPressed: () {}, child: Text("Marketplace")),
              TextButton(onPressed: () {}, child: Text("License")),
              TextButton(onPressed: () {}, child: Text("Terms of Use")),
              TextButton(onPressed: () {}, child: Text("Blog")),
            ],
          ),
          // _buildChartsRow(context),
          // const SizedBox(height: 24),
          // _buildTablesRow(context),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          _StatsCard(
            title: 'Earnings',
            value: '\$350.4',
            subtitle: '+55% since last month',
            icon: Icons.trending_up,
            color: AppColors.success,
          ),
          const SizedBox(height: 16),
          _StatsCard(
            title: 'Spend this Month',
            value: '\$682.5',
            subtitle: '+15% since last month',
            icon: Icons.credit_card,
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),
          _StatsCard(
            title: 'Sales',
            value: '\$574.34',
            subtitle: '+124% since last month',
            icon: Icons.shopping_cart,
            color: AppColors.success,
          ),
          const SizedBox(height: 16),
          _StatsCard(
            title: 'Your Balance',
            value: '\$1,000',
            subtitle: '',
            icon: Icons.account_balance_wallet,
            color: AppColors.primary,
          ),
        ],
      ),
      desktop: Row(
        children: [
          Expanded(
            child: _StatsCard(
              title: 'Earnings',
              value: '\$350.4',
              subtitle: '+55% since last month',
              icon: Icons.trending_up,
              color: AppColors.success,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _StatsCard(
              title: 'Spend this Month',
              value: '\$682.5',
              subtitle: '+15% since last month',
              icon: Icons.credit_card,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _StatsCard(
              title: 'Sales',
              value: '\$574.34',
              subtitle: '+124% since last month',
              icon: Icons.shopping_cart,
              color: AppColors.success,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _StatsCard(
              title: 'Your Balance',
              value: '\$1,000',
              subtitle: '',
              icon: Icons.account_balance_wallet,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartsRow(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          _ChartCard(
            title: 'Total Spent',
            subtitle: 'This month',
            value: '\$37.5K',
            change: '+2.45%',
            height: 300,
          ),
          const SizedBox(height: 16),
          _ChartCard(
            title: 'Weekly Revenue',
            subtitle: '',
            value: '',
            change: '',
            height: 300,
          ),
        ],
      ),
      desktop: Row(
        children: [
          Expanded(
            flex: 2,
            child: _ChartCard(
              title: 'Total Spent',
              subtitle: 'This month',
              value: '\$37.5K',
              change: '+2.45%',
              height: 400,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 1,
            child: _ChartCard(
              title: 'Weekly Revenue',
              subtitle: '',
              value: '',
              change: '',
              height: 400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTablesRow(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          _TableCard(title: 'Check Table', height: 400),
          const SizedBox(height: 16),
          _TableCard(title: 'Complex Table', height: 400),
          const SizedBox(height: 16),
          _TableCard(title: 'Daily Traffic', height: 300),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _TableCard(title: 'Check Table', height: 300),
                const SizedBox(height: 24),
                _TableCard(title: 'Complex Table', height: 300),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 1,
            child: _TableCard(title: 'Daily Traffic', height: 300),
          ),
        ],
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _StatsCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Text(title, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 28),
            ),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.success,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String change;
  final double height;

  const _ChartCard({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.change,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: height,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 18),
            ),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            ],
            if (value.isNotEmpty) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    value,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(fontSize: 24),
                  ),
                  if (change.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Text(
                      change,
                      style: const TextStyle(
                        color: AppColors.success,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ],
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text('Chart Placeholder')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TableCard extends StatelessWidget {
  final String title;
  final double height;

  const _TableCard({required this.title, required this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: height,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkBorder
                            : AppColors.border,
                  ),
                ),
                child: const Center(child: Text('Table Placeholder')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCardModel {
  final String title;
  final String value;
  final String? icon;
  final String? subtitle;
  final String? subtitleText;
  final Color? subtitleColor;
  final Widget? customIcon;

  StatCardModel({
    required this.title,
    required this.value,
    this.icon,
    this.subtitle,
    this.subtitleColor,
    this.customIcon,
    this.subtitleText,
  });
}

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final List<StatCardModel> stats = [
      StatCardModel(
        icon: "assets/icons/ic_earnings_${isDark ? "dark" : "light"}.png",
        title: 'Earnings',
        value: '\$350.4',
      ),
      StatCardModel(
        icon: "assets/icons/ic_spent_${isDark ? "dark" : "light"}.png",
        title: 'Spend this Month',
        value: '\$682.5',
      ),
      StatCardModel(
        title: 'Sales',
        value: '\$574.34',
        subtitle: '+23%',
        subtitleText: "since last month",
        subtitleColor: Colors.green,
      ),
      StatCardModel(
        title: 'Your balance',
        value: '\$1,000',
        customIcon: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SvgPicture.network(
                'https://hatscripts.github.io/circle-flags/flags/us.svg',
                height: 24,
                width: 24,
              ),
            ),
            const Icon(Icons.arrow_drop_down, size: 18),
          ],
        ),
      ),
      StatCardModel(
        title: 'New Tasks',
        value: '154',
        icon: "assets/icons/ic_newtask.png",
      ),
      StatCardModel(
        icon: "assets/icons/ic_totalprojects_${isDark ? "dark" : "light"}.png",
        title: 'Total Projects',
        value: '2935',
      ),
    ];

    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // The parent ListView handles scrolling
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.responsive(mobile: 1, tablet: 2, desktop: 6),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: context.responsive(
          mobile: 3.0,
          tablet: 1.8,
          desktop: 2.0,
        ),
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        return StatCard(data: stats[index]);
      },
    );
  }
}

class StatCard extends StatelessWidget {
  final StatCardModel data;
  const StatCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: AppColors.border, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- Icon Section ---
          // It can display a standard icon or a custom widget (like the flag)
          if (data.icon != null)
            Flexible(
              flex: 0,
              child: Image.asset(
                data.icon!,
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
            ),

          const SizedBox(width: 12),

          // --- Text Content Section ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    data.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Flexible(
                  child: Text(
                    data.value,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (data.subtitle != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          data.subtitle!,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                            color: data.subtitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      if (data.subtitleText != null)
                        Flexible(
                          child: Text(
                            data.subtitleText!,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (data.customIcon != null)
            Flexible(flex: 0, child: data.customIcon!),
        ],
      ),
    );
  }
}

class MainDashboardGrid extends StatelessWidget {
  const MainDashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.responsive(mobile: 1, tablet: 4, desktop: 4);

    return StaggeredGrid.count(
      crossAxisCount: crossAxisCount,

      mainAxisSpacing: 20,
      crossAxisSpacing: 20,

      // The children are defined using StaggeredGridTile.
      // `crossAxisCellCount` = how many columns the tile spans.
      // `mainAxisCellCount` = how many rows the tile spans (its height).
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 2,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          child: TotalSpentCard(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 2,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          child: WeeklyRevenueCard(),
        ),
        // --- ROW 2 ---
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 4,
            desktop: 2,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 2,
            tablet: 3,
            desktop: 1,
          ),
          child: CheckTableCard(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Daily Traffic'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Your Pie Chart'),
        ),
        // --- ROW 3 ---
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 4,
            desktop: 2,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 2,
            tablet: 3,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Complex Table'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 3,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Tasks'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 3,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Calendar'),
        ),
        // --- ROW 4 ---
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Business Design'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Team Members'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Control Card Security'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          mainAxisCellCount: context.responsive(
            mobile: 1,
            tablet: 2,
            desktop: 1,
          ),
          child: const PlaceholderCard(title: 'Starbucks'),
        ),
      ],
    );
  }
}

// ------------------- NEW: PLACEHOLDER CARD -------------------
// A simple, styled placeholder to visualize the grid layout.
class PlaceholderCard extends StatelessWidget {
  final String title;
  const PlaceholderCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: AppColors.border, width: 1.5),
      ),
      child: Center(
        child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
