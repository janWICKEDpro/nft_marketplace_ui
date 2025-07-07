import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class ComplexTableCard extends StatelessWidget {
  const ComplexTableCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.responsive(mobile: 16, desktop: 24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildTable(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Complex Table",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: context.responsive(mobile: 18, desktop: 20),
          ),
        ),
        Image.asset(
          "assets/icons/ic_more_horiz${isDark ? "" : "_light"}.png",
          height: 30,
          width: 30,
        ),
      ],
    );
  }

  Widget _buildTable(BuildContext context) {
    return Responsive(
      mobile: _buildMobileTable(context),
      desktop: _buildDesktopTable(context),
    );
  }

  Widget _buildDesktopTable(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTableHeader(context),
              const SizedBox(height: 4),
              Divider(color: isDark ? AppColors.darkBorder : Color(0xffE9EDF7)),
              const SizedBox(height: 4),
              ..._tableData.map((data) => _buildTableRow(context, data)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileTable(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children:
                _tableData
                    .map((data) => _buildMobileCard(context, data))
                    .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "NAME",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "STATUS",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "DATE",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "PROGRESS",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(BuildContext context, TableRowData data) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBorder
                    : AppColors.border,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              data.name,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(flex: 2, child: _buildStatusChip(context, data.status)),
          Expanded(
            flex: 2,
            child: Text(
              data.date,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(flex: 2, child: _buildProgressBar(context, data.progress)),
        ],
      ),
    );
  }

  Widget _buildMobileCard(BuildContext context, TableRowData data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.darklight.withOpacity(0.5)
                : AppColors.lightbg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkBorder
                  : AppColors.border,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusChip(context, data.status),
              Text(data.date, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PROGRESS",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              _buildProgressBar(context, data.progress),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, TableStatus status) {
    Color backgroundColor;
    Color iconColor;
    IconData icon;
    String text;

    switch (status) {
      case TableStatus.approved:
        backgroundColor = AppColors.success;
        iconColor = Colors.white;
        icon = Icons.check;
        text = "Approved";
        break;
      case TableStatus.disabled:
        backgroundColor = Colors.red;
        iconColor = Colors.white;
        icon = Icons.close;
        text = "Disable";
        break;
      case TableStatus.error:
        backgroundColor = Colors.orange;
        iconColor = Colors.white;
        icon = Icons.error_outline;
        text = "Error";
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 12),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 6,
          decoration: BoxDecoration(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkBorder
                    : AppColors.border.withOpacity(0.3),
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static final List<TableRowData> _tableData = [
    TableRowData(
      name: "Horizon UI PRO",
      status: TableStatus.approved,
      date: "18 Apr 2022",
      progress: 0.85,
    ),
    TableRowData(
      name: "Horizon UI Free",
      status: TableStatus.disabled,
      date: "18 Apr 2022",
      progress: 0.45,
    ),
    TableRowData(
      name: "Marketplace",
      status: TableStatus.error,
      date: "20 May 2021",
      progress: 0.75,
    ),
    TableRowData(
      name: "Weekly Updates",
      status: TableStatus.approved,
      date: "12 Jul 2021",
      progress: 0.55,
    ),
  ];
}

enum TableStatus { approved, disabled, error }

class TableRowData {
  final String name;
  final TableStatus status;
  final String date;
  final double progress;

  TableRowData({
    required this.name,
    required this.status,
    required this.date,
    required this.progress,
  });
}
