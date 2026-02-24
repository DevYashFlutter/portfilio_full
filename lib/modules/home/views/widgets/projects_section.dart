import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';

class ProjectsSection extends StatelessWidget {
  final String title;
  final String type;

  const ProjectsSection({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
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
    ];

    final personalProjects = [
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
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      color: type == 'industry' ? AppColors.surface : AppColors.background,
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.purple, AppColors.cyan]).createShader(bounds),
            child: Text(
              title,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            type == 'industry' ? 'Production-grade applications serving millions of users' : 'Side projects exploring new technologies and creative ideas',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: AppColors.textBody),
          ),
          const SizedBox(height: 64),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 24, mainAxisSpacing: 24, childAspectRatio: 0.55),
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
        transform: isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF101828).withAlpha(200) : const Color(0xFF101828).withAlpha(153),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isHovered ? Colors.transparent : AppColors.purple.withAlpha(76)),
          gradient: isHovered ? const LinearGradient(colors: [Color(0xFFC084FC), Color(0xFF38BDF8)], begin: Alignment.topLeft, end: Alignment.bottomRight) : null,
          boxShadow: isHovered ? [BoxShadow(color: const Color(0xFFC084FC).withAlpha(100), blurRadius: 25, offset: const Offset(0, 10))] : null,
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
                        Icon(Icons.phone_iphone_rounded, size: 48, color: isHovered ? Colors.white : AppColors.purple.withAlpha(127)),
                        const SizedBox(height: 12),
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
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: isHovered ? Colors.white.withAlpha(230) : AppColors.textBody),
            ),
            const SizedBox(height: 16),
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
                _StatItem(label: 'Users', value: widget.users, icon: Icons.people_outline_rounded, isHovered: isHovered),
                _StatItem(label: 'Rating', value: widget.rating, icon: Icons.star_outline_rounded, isHovered: isHovered),
                _StatItem(label: 'Uptime', value: widget.uptime, icon: Icons.timer_outlined, isHovered: isHovered),
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
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isHovered ? Colors.white.withAlpha(30) : Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 16, color: isHovered ? Colors.white : AppColors.textBody),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textBody)),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
