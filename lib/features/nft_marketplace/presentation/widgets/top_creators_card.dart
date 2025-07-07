import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class TopCreatorsCard extends StatelessWidget {
  const TopCreatorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Theme.of(context).cardColor : AppColors.lightbgl,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(
              context.responsive(mobile: 20, desktop: 24),
            ),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkBorder : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                _buildHeader(context),
                SizedBox(height: context.responsive(mobile: 20, desktop: 24)),
                _buildTableHeader(context),
              ],
            ),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.responsive(mobile: 20, desktop: 24),
            ),
            child: _buildCreatorsList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Creators',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: context.responsive(mobile: 20, desktop: 24),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isDark ? AppColors.purple : AppColors.lightbg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'See all',
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.purple,
              fontSize: context.responsive(mobile: 12, desktop: 13),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    return Responsive(
      mobile: const SizedBox.shrink(), // Hide headers on mobile
      desktop: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Name',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Artworks',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Rating',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatorsList(BuildContext context) {
    return Column(
      children:
          _creatorsData.asMap().entries.map((entry) {
            final index = entry.key;
            final creator = entry.value;

            return _buildCreatorItem(
              context,
              creator,
              isLast: index == _creatorsData.length - 1,
            );
          }).toList(),
    );
  }

  Widget _buildCreatorItem(
    BuildContext context,
    CreatorData creator, {
    bool isLast = false,
  }) {
    return Container(
      margin: EdgeInsets.only(
        bottom: isLast ? 0 : context.responsive(mobile: 12, desktop: 16),
      ),
      child: Responsive(
        mobile: _buildMobileCreatorItem(context, creator),
        desktop: _buildDesktopCreatorItem(context, creator),
      ),
    );
  }

  Widget _buildDesktopCreatorItem(BuildContext context, CreatorData creator) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Expanded(flex: 3, child: _buildCreatorInfo(context, creator)),
          Expanded(
            flex: 2,
            child: Text(
              creator.artworks.toString(),
              style: TextStyle(
                fontSize: context.responsive(mobile: 14, desktop: 15),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(flex: 2, child: _buildRatingBar(context, creator.rating)),
        ],
      ),
    );
  }

  Widget _buildMobileCreatorItem(BuildContext context, CreatorData creator) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildCreatorInfo(context, creator)),
              Text(
                creator.artworks.toString(),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rating',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              _buildRatingBar(context, creator.rating),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorInfo(BuildContext context, CreatorData creator) {
    return Row(
      children: [
        _buildAvatar(context, creator),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            creator.username,
            style: TextStyle(
              fontSize: context.responsive(mobile: 14, desktop: 15),
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context, CreatorData creator) {
    final avatarSize = context.responsive(mobile: 32.0, desktop: 36.0);

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
      ),
      child: ClipOval(
        child:
            creator.avatarUrl != null
                ? Image.network(
                  creator.avatarUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildDefaultAvatar(creator, avatarSize);
                  },
                )
                : _buildDefaultAvatar(creator, avatarSize),
      ),
    );
  }

  Widget _buildDefaultAvatar(CreatorData creator, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: creator.avatarColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          creator.initials,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.4,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingBar(BuildContext context, double rating) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.2) : AppColors.gutter,
        borderRadius: BorderRadius.circular(3),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: rating,
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.purple : AppColors.darkPurple,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }

  static final List<CreatorData> _creatorsData = [
    CreatorData(
      id: '1',
      username: '@maddison_c21',
      artworks: 9821,
      rating: 0.95,
      avatarColor: const Color(0xffE91E63),
      initials: 'MC',
    ),
    CreatorData(
      id: '2',
      username: '@karl.will02',
      artworks: 7032,
      rating: 0.88,
      avatarColor: const Color(0xff2196F3),
      initials: 'KW',
    ),
    CreatorData(
      id: '3',
      username: '@andreea.lz',
      artworks: 5204,
      rating: 0.82,
      avatarColor: const Color(0xffFF9800),
      initials: 'AL',
    ),
    CreatorData(
      id: '4',
      username: '@abraham47y',
      artworks: 4309,
      rating: 0.76,
      avatarColor: const Color(0xff4CAF50),
      initials: 'AB',
    ),
    CreatorData(
      id: '5',
      username: '@simmmple.web',
      artworks: 3871,
      rating: 0.70,
      avatarColor: AppColors.purple,
      initials: 'SW',
    ),
    CreatorData(
      id: '6',
      username: '@venus.sys',
      artworks: 3152,
      rating: 0.65,
      avatarColor: const Color(0xff9C27B0),
      initials: 'VS',
    ),
    CreatorData(
      id: '7',
      username: '@ape.vpp8',
      artworks: 2907,
      rating: 0.58,
      avatarColor: const Color(0xffF44336),
      initials: 'AP',
    ),
    CreatorData(
      id: '8',
      username: '@leon_pwrr',
      artworks: 2309,
      rating: 0.52,
      avatarColor: const Color(0xff607D8B),
      initials: 'LP',
    ),
  ];
}

class CreatorData {
  final String id;
  final String username;
  final int artworks;
  final double rating;
  final String? avatarUrl;
  final Color avatarColor;
  final String initials;

  CreatorData({
    required this.id,
    required this.username,
    required this.artworks,
    required this.rating,
    this.avatarUrl,
    required this.avatarColor,
    required this.initials,
  });
}
