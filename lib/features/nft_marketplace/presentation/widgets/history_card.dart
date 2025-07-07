import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.responsive(mobile: 20, desktop: 24)),
      decoration: BoxDecoration(
        color: const Color(0xff1B2559),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: context.responsive(mobile: 20, desktop: 24)),
          _buildHistoryList(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'History',
          style: TextStyle(
            color: Colors.white,
            fontSize: context.responsive(mobile: 18, desktop: 20),
            fontWeight: FontWeight.bold,
            letterSpacing: -0.2,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.responsive(mobile: 12, desktop: 13),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryList(BuildContext context) {
    return Column(
      children:
          _historyData.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            return _buildHistoryItem(
              context,
              item,

              isLast: index == _historyData.length - 1,
            );
          }).toList(),
    );
  }

  Widget _buildHistoryItem(
    BuildContext context,
    HistoryItem item, {
    bool isLast = false,
  }) {
    return Container(
      margin: EdgeInsets.only(
        bottom: isLast ? 0 : context.responsive(mobile: 16, desktop: 18),
      ),
      child: Responsive(
        mobile: _buildMobileHistoryItem(context, item),
        desktop: _buildDesktopHistoryItem(context, item),
      ),
    );
  }

  Widget _buildDesktopHistoryItem(BuildContext context, HistoryItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildThumbnail(context, item),
              const SizedBox(width: 16),
              _buildItemInfo(context, item),
              const SizedBox(width: 16),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icons/ic_eth_dark.png",
                height: 18,
                width: 18,
              ),
              const SizedBox(width: 4),
              Text(
                '${item.price} ETH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.responsive(mobile: 13, desktop: 14),
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            item.timeAgo,
            style: TextStyle(
              color: Colors.white.withOpacity(0.65),
              fontSize: context.responsive(mobile: 11, desktop: 12),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHistoryItem(BuildContext context, HistoryItem item) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 0.5),
      ),
      child: Row(
        children: [
          _buildThumbnail(context, item),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildItemInfo(context, item)),
                    const SizedBox(width: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.diamond,
                          color: Colors.white.withOpacity(0.9),
                          size: context.responsive(mobile: 12, desktop: 14),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${item.price} ETH',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.responsive(
                              mobile: 13,
                              desktop: 14,
                            ),
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.timeAgo,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.65),
                        fontSize: context.responsive(mobile: 11, desktop: 12),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.1,
                      ),
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

  Widget _buildThumbnail(BuildContext context, HistoryItem item) {
    final thumbnailSize = context.responsive(mobile: 48.0, desktop: 56.0);

    return Container(
      width: thumbnailSize,
      height: thumbnailSize,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          "assets/images/nft2.png",
          height: thumbnailSize,
          width: thumbnailSize,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildItemInfo(BuildContext context, HistoryItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.responsive(mobile: 14, desktop: 15),
            fontWeight: FontWeight.w600,
            letterSpacing: -0.1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          'By ${item.creator}',
          style: TextStyle(
            color: Colors.white.withOpacity(0.65),
            fontSize: context.responsive(mobile: 12, desktop: 13),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  static final List<HistoryItem> _historyData = [
    HistoryItem(
      id: '1',
      name: 'Colorful Heaven',
      creator: 'Mark Benjamin',
      price: '1.30',
      timeAgo: '30s ago',
      gradient: const LinearGradient(
        colors: [Color(0xffFF6B35), Color(0xff7209B7)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayWidget: const Icon(Icons.palette, color: Colors.white70, size: 20),
    ),
    HistoryItem(
      id: '2',
      name: 'Abstract Colors',
      creator: 'Esthera Jackson',
      price: '0.91',
      timeAgo: '58s ago',
      gradient: const LinearGradient(
        colors: [Color(0xff00F5A0), Color(0xff00D9F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayWidget: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    HistoryItem(
      id: '3',
      name: 'ETH AI Brain',
      creator: 'Nick Wilson',
      price: '2.82',
      timeAgo: '1m ago',
      gradient: const LinearGradient(
        colors: [Color(0xff667eea), Color(0xff764ba2)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayWidget: const Icon(
        Icons.psychology,
        color: Colors.white70,
        size: 18,
      ),
    ),
    HistoryItem(
      id: '4',
      name: 'Swipe Circles',
      creator: 'Peter Will',
      price: '2.30',
      timeAgo: '1m ago',
      gradient: const LinearGradient(
        colors: [Color(0xffa8edea), Color(0xfffed6e3)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayWidget: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
        ),
      ),
    ),
    HistoryItem(
      id: '5',
      name: 'Mesh Gradients',
      creator: 'Will Smith',
      price: '0.56',
      timeAgo: '2m ago',
      gradient: const LinearGradient(
        colors: [Color(0xff6a11cb), Color(0xff2575fc)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayWidget: Stack(
        children: [
          Positioned(
            top: 2,
            left: 2,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    ),
    HistoryItem(
      id: '6',
      name: '3D Cubes Art',
      creator: 'Manny Gates',
      price: '6.58',
      timeAgo: '3m ago',
      gradient: const LinearGradient(
        colors: [Color(0xffFFB75E), Color(0xffED8F03)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayWidget: Stack(
        children: [
          Transform.rotate(
            angle: 0.785398, // 45 degrees
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ],
      ),
    ),
  ];
}

class HistoryItem {
  final String id;
  final String name;
  final String creator;
  final String price;
  final String timeAgo;
  final Gradient gradient;
  final Widget? overlayWidget;

  const HistoryItem({
    required this.id,
    required this.name,
    required this.creator,
    required this.price,
    required this.timeAgo,
    required this.gradient,
    this.overlayWidget,
  });

  // Factory constructors for common NFT types
  factory HistoryItem.colorful({
    required String id,
    required String name,
    required String creator,
    required String price,
    required String timeAgo,
  }) {
    return HistoryItem(
      id: id,
      name: name,
      creator: creator,
      price: price,
      timeAgo: timeAgo,
      gradient: const LinearGradient(
        colors: [Color(0xffFF6B35), Color(0xff7209B7)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayWidget: const Icon(Icons.palette, color: Colors.white70, size: 20),
    );
  }

  factory HistoryItem.abstract({
    required String id,
    required String name,
    required String creator,
    required String price,
    required String timeAgo,
  }) {
    return HistoryItem(
      id: id,
      name: name,
      creator: creator,
      price: price,
      timeAgo: timeAgo,
      gradient: const LinearGradient(
        colors: [Color(0xff00F5A0), Color(0xff00D9F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      overlayWidget: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  // Copy method for immutability
  HistoryItem copyWith({
    String? id,
    String? name,
    String? creator,
    String? price,
    String? timeAgo,
    Gradient? gradient,
    Widget? overlayWidget,
  }) {
    return HistoryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      creator: creator ?? this.creator,
      price: price ?? this.price,
      timeAgo: timeAgo ?? this.timeAgo,
      gradient: gradient ?? this.gradient,
      overlayWidget: overlayWidget ?? this.overlayWidget,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HistoryItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
