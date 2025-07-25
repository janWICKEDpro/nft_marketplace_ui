import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';

class PieChartCard extends StatelessWidget {
  const PieChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: AppColors.border, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Your Pie Chart",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    "Monthly",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, size: 24),
                ],
              ),
            ],
          ),

          Image.asset("assets/icons/Chart.png", height: 140, width: 140),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkBorder : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow:
                  isDark
                      ? []
                      : [
                        BoxShadow(
                          color: Color(0xff7090B0).withValues(alpha: 0.12),
                          offset: Offset(0, 18),
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      spacing: 3,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 5,
                        ),
                        Text(
                          "Your files",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      "63%",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 1,
                  color:
                      isDark
                          ? Colors.white.withValues(alpha: 0.1)
                          : AppColors.lightbg,
                ),
                Column(
                  children: [
                    Row(
                      spacing: 3,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.cyan,
                          radius: 5,
                        ),
                        Text(
                          "System",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      "63%",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
