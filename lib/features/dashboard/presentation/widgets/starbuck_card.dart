import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';

class StarbuckCard extends StatelessWidget {
  const StarbuckCard({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                Image.asset("assets/icons/ic_star_bg.png"),
                Positioned(
                  top: 150,
                  child: Image.asset(
                    "assets/icons/ic_star_logo.png",
                    height: 60,
                    width: 60,
                  ),
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Image.asset(
                    "assets/icons/ic_more_star.png",
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Starbucks",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Row(
            spacing: 5,
            children: [
              Image.asset(
                "assets/icons/ic_fastfood.png",
                height: 18,
                width: 18,
              ),
              Text(
                "10% cashback & off",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
