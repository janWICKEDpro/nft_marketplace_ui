import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      getTooltipColor: (group) => Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (
        BarChartGroupData group,
        int groupIndex,
        BarChartRodData rod,
        int rodIndex,
      ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(color: AppColors.cyan, fontWeight: FontWeight.bold),
        );
      },
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text("${value.toInt()}", style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
  );

  FlBorderData get borderData => FlBorderData(show: false);

  LinearGradient get _barsGradient => LinearGradient(
    colors: [AppColors.darkTextPrimary, AppColors.cyan, AppColors.primary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 17,
      barRods: [
        BarChartRodData(
          toY: 8,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 18,
      barRods: [
        BarChartRodData(
          toY: 10,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 19,
      barRods: [
        BarChartRodData(
          toY: 14,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 20,
      barRods: [
        BarChartRodData(
          toY: 15,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 21,
      barRods: [
        BarChartRodData(
          toY: 13,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 22,
      barRods: [
        BarChartRodData(
          toY: 10,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 23,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 24,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 25,
      barRods: [
        BarChartRodData(
          toY: 16,
          gradient: _barsGradient,
          width: 12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ],
      showingTooltipIndicators: [0],
    ),
  ];
}

class _BarChart2 extends StatelessWidget {
  const _BarChart2();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: true,
    touchTooltipData: BarTouchTooltipData(
      getTooltipColor: (group) => Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (
        BarChartGroupData group,
        int groupIndex,
        BarChartRodData rod,
        int rodIndex,
      ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(color: AppColors.cyan, fontWeight: FontWeight.bold),
        );
      },
    ),
  );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text("${value.toInt()}", style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
  );

  FlBorderData get borderData => FlBorderData(show: false);

  LinearGradient get _barsGradient => LinearGradient(
    colors: [AppColors.primary, AppColors.primary.withAlpha(100)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 00,
      barRods: [BarChartRodData(toY: 10, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 04,
      barRods: [BarChartRodData(toY: 8, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 08,
      barRods: [BarChartRodData(toY: 14, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 10,
      barRods: [BarChartRodData(toY: 15, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 12,
      barRods: [BarChartRodData(toY: 13, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 22,
      barRods: [BarChartRodData(toY: 10, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 14,
      barRods: [BarChartRodData(toY: 16, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 16,
      barRods: [BarChartRodData(toY: 16, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 25,
      barRods: [BarChartRodData(toY: 16, gradient: _barsGradient, width: 10)],
      showingTooltipIndicators: [0],
    ),
  ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(aspectRatio: 2.7, child: _BarChart());
  }
}

class BarChartSample4 extends StatefulWidget {
  const BarChartSample4({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample4State();
}

class BarChartSample4State extends State<BarChartSample4> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(aspectRatio: 1.4, child: _BarChart2());
  }
}
