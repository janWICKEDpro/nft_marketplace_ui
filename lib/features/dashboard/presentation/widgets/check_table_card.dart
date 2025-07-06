import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';

class CheckTableCard extends StatefulWidget {
  const CheckTableCard({super.key});

  @override
  State<CheckTableCard> createState() => _CheckTableCardState();
}

class _CheckTableCardState extends State<CheckTableCard> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: AppColors.border, width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Weekly Revenue",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Spacer(),
              Image.asset("assets/icons/ic_btn_tab.png", height: 30, width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
