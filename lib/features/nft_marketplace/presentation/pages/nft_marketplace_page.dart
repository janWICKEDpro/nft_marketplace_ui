import 'package:flutter/material.dart';
import 'package:nft_marketplace/features/nft_marketplace/presentation/widgets/history_card.dart';
import 'package:nft_marketplace/features/nft_marketplace/presentation/widgets/nft_card.dart';
import 'package:nft_marketplace/features/nft_marketplace/presentation/widgets/top_creators_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class NftMarketplacePage extends StatelessWidget {
  const NftMarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: const _MobileLayout(),
        desktop: const _DesktopLayout(),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: const _MainContent()),
        Expanded(flex: 1, child: const _Sidebar()),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [_MainContent(), SizedBox(height: 24), _Sidebar()],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.responsive(mobile: 16, desktop: 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _HeroSection(),
          const SizedBox(height: 40),
          const _TrendingSection(),
          const SizedBox(height: 40),
          const _RecentlyAddedSection(),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("assets/images/bg_main.png"),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(context.responsive(mobile: 24, desktop: 40)),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Responsive(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeroText(context),
                const SizedBox(height: 24),
                _buildHeroActions(context),
              ],
            ),
            desktop: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeroText(context),
                      const SizedBox(height: 32),
                      _buildHeroActions(context),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.palette_rounded,
                      size: 80,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover, collect, and\nsell extraordinary NFTs',
          style: TextStyle(
            color: Colors.white,
            fontSize: context.responsive(mobile: 24, desktop: 32),
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Enter in this creative world. Discover now the\nlatest NFTs or start creating your own!',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: context.responsive(mobile: 14, desktop: 16),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroActions(BuildContext context) {
    return Responsive(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPrimaryButton(),
          const SizedBox(height: 12),
          _buildSecondaryButton(),
        ],
      ),
      desktop: Row(
        children: [
          _buildPrimaryButton(),
          const SizedBox(width: 16),
          _buildSecondaryButton(),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.purple,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Discover now',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: const Text(
        'Watch video',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _TrendingSection extends StatelessWidget {
  const _TrendingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Trending NFTs',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: context.responsive(mobile: 20, desktop: 24),
              ),
            ),
            const _CategoryTabs(),
          ],
        ),
        const SizedBox(height: 24),
        const _NFTGrid(),
      ],
    );
  }
}

class _RecentlyAddedSection extends StatelessWidget {
  const _RecentlyAddedSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Added',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: context.responsive(mobile: 20, desktop: 24),
          ),
        ),
        const SizedBox(height: 24),
        const _NFTGrid(),
      ],
    );
  }
}

class _CategoryTabs extends StatelessWidget {
  const _CategoryTabs();

  @override
  Widget build(BuildContext context) {
    final categories = ['Art', 'Music', 'Collectibles', 'Sports'];

    return Responsive(
      mobile: const SizedBox.shrink(),
      desktop: Row(
        children:
            categories.map((category) {
              final isSelected = category == 'Art';
              return Container(
                margin: const EdgeInsets.only(left: 8),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isSelected ? AppColors.darkBorder : Colors.transparent,
                    foregroundColor:
                        Theme.of(context).textTheme.bodyMedium?.color,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _NFTGrid extends StatelessWidget {
  const _NFTGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = context.responsive(
          mobile: 1,
          tablet: 2,
          desktop: 3,
        );
        final childAspectRatio = context.responsive(mobile: 1.2, desktop: 0.8);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: 3,
          itemBuilder: (context, index) => const NftCard(),
        );
      },
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive(mobile: 16, desktop: 16)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopCreatorsCard(),
            const SizedBox(height: 32),
            HistoryCard(),
          ],
        ),
      ),
    );
  }
}

class _History extends StatelessWidget {
  const _History();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'History',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(fontSize: 18),
                ),
                TextButton(onPressed: () {}, child: const Text('See all')),
              ],
            ),
            const SizedBox(height: 16),
            ...List.generate(5, (index) => const _HistoryItem()),
          ],
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.image, color: AppColors.purple, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NFT Name',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'By Creator',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '2.5 ETH',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '2m ago',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
