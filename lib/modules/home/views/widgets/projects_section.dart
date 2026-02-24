import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';

class ProjectsSection extends StatelessWidget {
  final String title;
  final String type;

  const ProjectsSection({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;
    final bool isTablet = width < 1200 && width >= 850;

    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 4);

    // Mock data for projects
    final industryProjects = [
      {
        'title': 'Edepto',
        'desc': 'Comprehensive education platform with live classes, assignments, and progress tracking',
        'tags': ['Flutter', 'Firebase', 'GetX'],
        'users': '500K+',
        'rating': '4.8',
        'uptime': '99%',
      },
      {
        'title': 'Unibit Games',
        'desc': 'Multi-game platform offering fantasy sports with real-time multiplayer',
        'tags': ['Flutter', 'Firebase', 'Hive'],
        'users': '2M+',
        'rating': '4.6',
        'uptime': '95%',
      },
      {
        'title': 'Unibit11',
        'desc': 'Fantasy cricket platform with live match updates and competitive leagues',
        'tags': ['Flutter', 'REST API', 'GetX'],
        'users': '1.5M+',
        'rating': '4.7',
        'uptime': '97%',
      },
      {
        'title': 'Unibit Pool',
        'desc': 'Pool gaming platform with multiplayer matches and tournaments',
        'tags': ['Flutter', 'Firebase'],
        'users': '800K+',
        'rating': '4.5',
        'uptime': '96%',
      },
      {
        'title': 'Ludo24',
        'desc': 'Digital Ludo game with multiplayer capabilities and real-time gaming',
        'tags': ['Flutter', 'WebSocket'],
        'users': '1M+',
        'rating': '4.6',
        'uptime': '98%',
      },
      {
        'title': 'Games11',
        'desc': 'Comprehensive gaming platform with multiple game modes and features',
        'tags': ['Flutter', 'Firebase'],
        'users': '600K+',
        'rating': '4.4',
        'uptime': '94%',
      },
      {
        'title': 'Newsflick',
        'desc': 'News aggregation app with personalized feeds and real-time updates',
        'tags': ['Flutter', 'REST API'],
        'users': '300K+',
        'rating': '4.7',
        'uptime': '99%',
      },
      {
        'title': 'Moina Chat',
        'desc': 'Real-time messaging app with end-to-end encryption and media sharing',
        'tags': ['Flutter', 'Firebase'],
        'users': '250K+',
        'rating': '4.8',
        'uptime': '97%',
      },
    ];

    final personalProjects = [
      {
        'title': 'Teachers Recruitment',
        'desc': 'Platform connecting schools with qualified teachers efficiently',
        'tags': ['Flutter', 'GetX'],
        'users': '150K+',
        'rating': '4.6',
        'uptime': '98%',
      },
      {
        'title': 'PowerTag',
        'desc': 'NFC-based tagging system for asset management and tracking',
        'tags': ['Flutter', 'NFC'],
        'users': '50K+',
        'rating': '4.5',
        'uptime': '99%',
      },
      {
        'title': 'Daily Credit',
        'desc': 'Microfinance app for loan management and credit scoring',
        'tags': ['Flutter', 'Hive'],
        'users': '200K+',
        'rating': '4.7',
        'uptime': '96%',
      },
      {
        'title': 'Portfolio Website',
        'desc': 'Modern, animated portfolio with interactive UI built with Flutter Web',
        'tags': ['Flutter Web'],
        'users': 'New',
        'rating': 'N/A',
        'uptime': '100%',
      },
    ];

    final projects = type == 'industry' ? industryProjects : personalProjects;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: isMobile ? 24 : 40),
      color: type == 'industry' ? AppColors.surface : AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (bounds) =>
                    LinearGradient(colors: type == 'industry' ? [AppColors.purple, AppColors.cyan] : [AppColors.cyan, AppColors.purple]).createShader(bounds),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                type == 'industry' ? 'Production-grade applications serving millions of users' : 'Side projects exploring new technologies and creative ideas',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 14 : 16, color: AppColors.textBody.withAlpha(200)),
              ),
              const SizedBox(height: 48),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile ? 0.85 : 0.7,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return _ProjectCard(
                    title: project['title'] as String,
                    description: project['desc'] as String,
                    tags: project['tags'] as List<String>,
                    users: project['users'] as String,
                    rating: project['rating'] as String,
                    uptime: project['uptime'] as String,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tags;
  final String users;
  final String rating;
  final String uptime;

  const _ProjectCard({required this.title, required this.description, required this.tags, required this.users, required this.rating, required this.uptime});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: isHovered ? Matrix4.diagonal3Values(1.05, 1.05, 1.0) : Matrix4.identity(),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF101828).withAlpha(230) : const Color(0xFF101828).withAlpha(180),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isHovered ? Colors.white.withAlpha(50) : AppColors.purple.withAlpha(40)),
          boxShadow: isHovered ? [BoxShadow(color: const Color(0xFFC084FC).withAlpha(50), blurRadius: 20, offset: const Offset(0, 8))] : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for image (Phone Style)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isHovered ? const Color(0xFF1E293B).withAlpha(255) : const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: isHovered ? Colors.white24 : Colors.white10, width: 2),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [isHovered ? Colors.white.withAlpha(50) : Colors.white.withAlpha(25), Colors.transparent],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone_iphone_rounded, size: 40, color: isHovered ? Colors.white : AppColors.purple.withAlpha(127)),
                        const SizedBox(height: 8),
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: isHovered ? [const Shadow(color: Color(0xFFC084FC), blurRadius: 10)] : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: isHovered ? Colors.white.withAlpha(200) : AppColors.textBody.withAlpha(200)),
            ),
            const SizedBox(height: 12),
            Wrap(
              children: widget.tags
                  .map(
                    (tag) => Container(
                      margin: const EdgeInsets.only(right: 8, bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isHovered ? Colors.white.withAlpha(40) : AppColors.purple.withAlpha(102),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white.withAlpha(30)),
                      ),
                      child: Text(tag, style: const TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatItem(label: 'Users', value: widget.users, icon: Icons.group_rounded, isHovered: isHovered),
                _StatItem(label: 'Rating', value: widget.rating, icon: Icons.star_rounded, isHovered: isHovered),
                _StatItem(label: 'Uptime', value: widget.uptime, icon: Icons.bolt_rounded, isHovered: isHovered),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isHovered;

  const _StatItem({required this.label, required this.value, required this.icon, this.isHovered = false});

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    if (label == 'Users') {
      iconColor = const Color(0xFF22D3EE);
    } else if (label == 'Rating') {
      iconColor = const Color(0xFF4ADE80);
    } else {
      iconColor = const Color(0xFFFACC15);
    }

    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withAlpha(100),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 9, color: AppColors.textBody.withAlpha(150), fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
