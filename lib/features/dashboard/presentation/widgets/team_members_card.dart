import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class TeamMembersCard extends StatelessWidget {
  const TeamMembersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.responsive(mobile: 20, desktop: 24)),
      decoration: BoxDecoration(
        color: AppColors.darklight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: context.responsive(mobile: 20, desktop: 24)),
          _buildMembersList(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Team members',
          style: TextStyle(
            color: Colors.white,
            fontSize: context.responsive(mobile: 18, desktop: 20),
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset("assets/icons/ic_more_btn.png", height: 36, width: 36),
      ],
    );
  }

  Widget _buildMembersList(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          spacing: 5,
          children:
              _teamMembers.asMap().entries.map((entry) {
                final index = entry.key;
                final member = entry.value;

                return _buildMemberItem(
                  context,
                  member,
                  isLast: index == _teamMembers.length - 1,
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildMemberItem(
    BuildContext context,
    TeamMember member, {
    bool isLast = false,
  }) {
    return Container(
      margin: EdgeInsets.only(
        bottom: isLast ? 0 : context.responsive(mobile: 16, desktop: 20),
      ),
      child: Responsive(
        mobile: _buildMobileMemberItem(context, member),
        desktop: _buildDesktopMemberItem(context, member),
      ),
    );
  }

  Widget _buildDesktopMemberItem(BuildContext context, TeamMember member) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.darkBorder,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildAvatar(context, member),
          const SizedBox(width: 16),
          Expanded(child: _buildMemberInfo(context, member)),
          const SizedBox(width: 16),
          _buildMenuButton(context),
        ],
      ),
    );
  }

  Widget _buildMobileMemberItem(BuildContext context, TeamMember member) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          _buildAvatar(context, member),
          const SizedBox(width: 12),
          Expanded(child: _buildMemberInfo(context, member)),
          const SizedBox(width: 12),
          _buildMenuButton(context),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, TeamMember member) {
    final avatarSize = context.responsive(mobile: 48.0, desktop: 56.0);

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
      ),
      child: ClipOval(
        child:
            member.avatarUrl != null
                ? Image.network(
                  member.avatarUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildDefaultAvatar(context, member, avatarSize);
                  },
                )
                : _buildDefaultAvatar(context, member, avatarSize),
      ),
    );
  }

  Widget _buildDefaultAvatar(
    BuildContext context,
    TeamMember member,
    double size,
  ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: member.avatarColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          member.initials,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.35,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildMemberInfo(BuildContext context, TeamMember member) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          member.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.responsive(mobile: 15, desktop: 16),
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          member.role,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: context.responsive(mobile: 13, desktop: 14),
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: Icon(
        Icons.more_vert,
        color: Colors.white.withOpacity(0.8),
        size: 20,
      ),
    );
  }

  static final List<TeamMember> _teamMembers = [
    TeamMember(
      id: '1',
      name: 'Adela Parkson',
      role: 'Creative Director',
      avatarColor: const Color(0xffE91E63),
      initials: 'AP',
      avatarUrl:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
    ),
    TeamMember(
      id: '2',
      name: 'Christian Mad',
      role: 'Product Designer',
      avatarColor: const Color(0xff2196F3),
      initials: 'CM',
      avatarUrl:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
    ),
    TeamMember(
      id: '3',
      name: 'Jason Statham',
      role: 'Junior Graphic Designer',
      avatarColor: const Color(0xffFF9800),
      initials: 'JS',
      avatarUrl:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
    ),
  ];
}

class TeamMember {
  final String id;
  final String name;
  final String role;
  final String? avatarUrl;
  final Color avatarColor;
  final String initials;

  TeamMember({
    required this.id,
    required this.name,
    required this.role,
    this.avatarUrl,
    required this.avatarColor,
    required this.initials,
  });
}
