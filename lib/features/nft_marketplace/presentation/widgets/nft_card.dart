import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class NftCard extends StatelessWidget {
  const NftCard({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Image.asset("assets/images/nft1.png"),
              Positioned(
                right: 10,
                top: 15,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline,
                        color: AppColors.purple,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3D cubes Art",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "By Manny Gates",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              buildProfileStack(context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Current Bind: 6.58 ETH",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Place bid',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.responsive(mobile: 12, desktop: 13),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProfileStack(BuildContext context) {
    final avatarSize = context.responsive(mobile: 24.0, desktop: 28.0);
    final spacing = context.responsive(mobile: 12.0, desktop: 16.0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: spacing * 4 + avatarSize,
          height: avatarSize,
          child: Stack(
            children: [
              _buildAvatar(0 * spacing, Colors.pink, avatarSize),
              _buildAvatar(1 * spacing, Colors.blue, avatarSize),
              _buildAvatar(2 * spacing, Colors.orange, avatarSize),
              _buildAvatar(3 * spacing, Colors.purple, avatarSize),
              Positioned(
                left: 4 * spacing,
                child: Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
                    color: AppColors.darkbg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff1B2559),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '18+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.responsive(mobile: 10, desktop: 11),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(double leftPosition, Color color, double size) {
    return Positioned(
      left: leftPosition,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xff1B2559), width: 2),
        ),
        child: Icon(Icons.person, color: Colors.white, size: size * 0.5),
      ),
    );
  }
}
