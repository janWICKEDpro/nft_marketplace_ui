import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';

class StarbuckCard extends StatelessWidget {
  const StarbuckCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            border:
                isDark ? null : Border.all(color: AppColors.border, width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("assets/icons/ic_star_bg.png"),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Image.asset(
                      "assets/icons/ic_more_star.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
              Text(
                "Starbucks",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_fastfood.png",
                    height: 18,
                    width: 18,
                  ),
                  SizedBox(width: 5),
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
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/icons/ic_star_logo.png",
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
