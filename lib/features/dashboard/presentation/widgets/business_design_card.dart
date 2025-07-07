import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class BusinessDesignCard extends StatelessWidget {
  const BusinessDesignCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: context.responsive(mobile: 20, desktop: 24),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsive(mobile: 20, desktop: 24),
            ),
            child: _buildHeader(context),
          ),
          SizedBox(height: context.responsive(mobile: 20, desktop: 24)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsive(mobile: 20, desktop: 24),
            ),
            child: _buildMainContent(context),
          ),
          SizedBox(height: context.responsive(mobile: 24, desktop: 32)),
          _buildBottomSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/icons/ic_flame${isDark ? "" : "_light"}.png",
          height: 48,
          width: 48,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Business Design',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'New lesson is available',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Text(
      'What do you need to know to create better products?',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Responsive(
      mobile: _buildMobileBottomSection(context),
      desktop: _buildDesktopBottomSection(context),
    );
  }

  Widget _buildDesktopBottomSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkBorder : AppColors.lightbgl,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          spacing: 15,
          children: [
            Row(
              children: [
                _buildTimeInfo(context),
                const SizedBox(width: 24),
                _buildVideoInfo(context),
                const Spacer(),
              ],
            ),
            Row(
              children: [
                buildProfileStack(context),
                Spacer(),
                _buildGetStartedButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileBottomSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            _buildTimeInfo(context),
            const SizedBox(width: 24),
            _buildVideoInfo(context),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            buildProfileStack(context),
            const Spacer(),
            _buildGetStartedButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeInfo(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/icons/ic_timer.png", height: 18, width: 18),
        const SizedBox(width: 8),
        Text(
          '85 mins',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: context.responsive(mobile: 13, desktop: 14),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildVideoInfo(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/icons/ic_play.png", height: 18, width: 18),
        const SizedBox(width: 8),
        Text(
          'Video format',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: context.responsive(mobile: 13, desktop: 14),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget buildProfileStack(BuildContext context) {
    final avatarSize = context.responsive(mobile: 28.0, desktop: 32.0);
    final spacing = context.responsive(mobile: 20.0, desktop: 24.0);

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

  Widget _buildGetStartedButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isDark ? AppColors.purple : AppColors.darkPurple,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: context.responsive(mobile: 20, desktop: 24),
          vertical: context.responsive(mobile: 12, desktop: 14),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: Text(
        'Get Started',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
