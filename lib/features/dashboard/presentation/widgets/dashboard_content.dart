import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/business_design_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/calendar_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/check_table_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/complex_table_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/control_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/daily_traffic_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/pie_chart_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/starbuck_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/stat_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/task_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/team_members_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/total_spent_card.dart';
import 'package:nft_marketplace/features/dashboard/presentation/widgets/weekly_revenue_card.dart';

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
      physics: const NeverScrollableScrollPhysics(),
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

class MainDashboardGrid extends StatelessWidget {
  const MainDashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.responsive(mobile: 1, tablet: 4, desktop: 4);

    return StaggeredGrid.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
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
          child: DailyTrafficCard(),
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
          child: PieChartCard(),
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
          child: ComplexTableCard(),
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
          child: TasksCard(),
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
          child: CalendarCard(),
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
          child: BusinessDesignCard(),
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
          child: TeamMembersCard(),
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
          child: ControlCard(),
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
          child: StarbuckCard(),
        ),
      ],
    );
  }
}
// class PlaceholderCard extends StatelessWidget {
//   final String title;
//   const PlaceholderCard({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(20),
//         border: isDark ? null : Border.all(color: AppColors.border, width: 1.5),
//       ),
//       child: Center(
//         child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
//       ),
//     );
//   }
// }
