import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/widgets/line_chart.dart';

class TotalSpentCard extends StatelessWidget {
  const TotalSpentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: AppColors.border, width: 1.5),
      ),
      child: Column(
        spacing: 15,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : AppColors.lightbg,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    Image.asset(
                      "assets/icons/ic_calendar.png",
                      height: 16,
                      width: 16,
                    ),
                    Text(
                      "This month",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Image.asset(
                "assets/icons/ic_btn_${isDark ? "tab" : "light"}.png",
                height: 30,
                width: 30,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$ 37.5K",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      Text(
                        "Total Spent",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Image.asset(
                        "assets/icons/ic_up.png",
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        "+2.45%",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    spacing: 5,
                    children: [
                      Image.asset(
                        "assets/icons/ic_good.png",
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        "On Track",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    ".",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox(child: LineChartSample1())),
            ],
          ),
        ],
      ),
    );
  }
}
