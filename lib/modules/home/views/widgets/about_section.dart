import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/theme/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF020617), // slate-950
            Color(0xFF0F172A), // slate-900
            Color(0xFF020617), // slate-950
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 40),
      child: Stack(
        children: [
          // 1. Background Orbs
          const Positioned.fill(child: _AboutBackgroundOrbs()),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // Section Header
                  const _AboutHeader(),
                  const SizedBox(height: 80),

                  // Quick Highlights Grid
                  const _AboutHighlightsGrid(),
                  const SizedBox(height: 100),

                  // Two Column Content: Timeline & Skills
                  if (isMobile)
                    Column(
                      children: [
                        const _AboutExperienceTimeline(),
                        const SizedBox(height: 80),
                        const _AboutSkillsSection(),
                      ],
                    )
                  else
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: _AboutExperienceTimeline()),
                        SizedBox(width: 60),
                        Expanded(flex: 5, child: _AboutSkillsSection()),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutBackgroundOrbs extends StatelessWidget {
  const _AboutBackgroundOrbs();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          right: -50,
          child: Container(
            width: 400,
            height: 400,
                    decoration: BoxDecoration(
              color: const Color(0xFFA855F7).withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
          )
          .animate(onPlay: (c) => c.repeat())
          .scale(
            begin: const Offset(1, 1),
            end: const Offset(1.2, 1.2),
            duration: const Duration(seconds: 8),
            curve: Curves.easeInOut,
          )
          .custom(
            builder: (context, value, child) => Opacity(
              opacity: 0.2 + (value * 0.2),
              child: child,
            ),
          )
          .blurXY(begin: 80, end: 100),
        ),
      ],
    );
  }
}

class _AboutHeader extends StatelessWidget {
  const _AboutHeader();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFC084FC), Color(0xFF22D3EE)],
          ).createShader(bounds),
          child: Text(
            'About Me',
            style: TextStyle(
              fontSize: isMobile ? 36 : 56,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 800))
        .moveY(begin: 30, end: 0, duration: const Duration(milliseconds: 800)),
        const SizedBox(height: 16),
        Text(
          'Passionate about crafting exceptional mobile experiences',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 14 : 18,
            color: const Color(0xFF94A3B8), // slate-400
          ),
        )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200)),
      ],
    );
  }
}

class _AboutHighlightsGrid extends StatelessWidget {
  const _AboutHighlightsGrid();

  @override
  Widget build(BuildContext context) {
    final highlights = [
      {
        'icon': Icons.business_center_rounded,
        'title': 'Large-Scale Production',
        'desc': 'Apps used by millions of users daily',
      },
      {
        'icon': Icons.bolt_rounded,
        'title': 'Performance Optimization',
        'desc': 'Reduced app load time by 40%',
      },
      {
        'icon': Icons.emoji_events_rounded,
        'title': 'Cross-Platform Expert',
        'desc': 'Single codebase for iOS & Android',
      },
      {
        'icon': Icons.groups_rounded,
        'title': 'Scalable Architecture',
        'desc': 'Clean code & maintainable solutions',
      },
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: List.generate(
        highlights.length,
        (index) => _HighlightCard(
          icon: highlights[index]['icon'] as IconData,
          title: highlights[index]['title'] as String,
          desc: highlights[index]['desc'] as String,
          index: index,
        ).animate().fadeIn(
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: index * 100),
        ).moveY(
          begin: 30,
          end: 0,
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: index * 100),
        ),
      ),
    );
  }
}

class _HighlightCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String desc;
  final int index;

  const _HighlightCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.index,
  });

  @override
  State<_HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<_HighlightCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isMobile ? double.infinity : 260,
        child: Stack(
          children: [
            // Hover Glow
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isHovered ? 1.0 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFA855F7).withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                    radius: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            // Card Content
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A).withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isHovered
                          ? const Color(0xFFA855F7).withValues(alpha: 0.6) : const Color(0xFFA855F7).withValues(alpha: 0.2), width: 1,
                    ),
                    boxShadow: isHovered ? [BoxShadow(color: const Color(0xFFA855F7).withValues(alpha: 0.1), blurRadius: 20, spreadRadius: 5)] : [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFA855F7).withValues(alpha: 0.2), const Color(0xFF06B6D4).withValues(alpha: 0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          widget.icon,
                          color: const Color(0xFFC084FC),
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.desc,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF94A3B8),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).scale(
        begin: const Offset(1, 1),
        end: const Offset(1.02, 1.02),
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}

class _AboutExperienceTimeline extends StatelessWidget {
  const _AboutExperienceTimeline();

  @override
  Widget build(BuildContext context) {
    final timeline = [
      {
        'period': '2023 - Present',
        'role': 'Flutter Developer',
        'company': 'Tech Company',
        'achievements': [
          'Developed 11+ production-ready mobile applications',
          'Implemented CI/CD pipeline reducing deployment time by 50%',
          'Optimized app performance serving millions of users',
          'Led mobile development for gaming and educational platforms',
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Professional Experience',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 40),
        ...timeline.map((item) => _TimelineItem(
              period: item['period'] as String,
              role: item['role'] as String,
              company: item['company'] as String,
              achievements: item['achievements'] as List<String>,
            )),
      ],
    ).animate().fadeIn(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 300),
    ).moveX(
      begin: -30,
      end: 0,
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 300),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final String period;
  final String role;
  final String company;
  final List<String> achievements;

  const _TimelineItem({
    required this.period,
    required this.role,
    required this.company,
    required this.achievements,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline Line & Dot
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [const Color(0xFFA855F7), const Color(0xFF06B6D4), Colors.transparent],
                      ),
                    ),
                  ),
                  _PulsingDot(),
                ],
              ),
            ),
            const SizedBox(width: 24),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F172A).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isHovered ? const Color(0xFFA855F7).withValues(alpha: 0.4) : const Color(0xFFA855F7).withValues(alpha: 0.2)),
                        boxShadow: isHovered ? [BoxShadow(color: const Color(0xFFA855F7).withValues(alpha: 0.1), blurRadius: 20, spreadRadius: 2)] : [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.period,
                            style: const TextStyle(color: Color(0xFFC084FC), fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.role,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            widget.company,
                            style: const TextStyle(color: Color(0xFF22D3EE), fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 16),
                          ...widget.achievements.map(
                            (achievement) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('▹', style: TextStyle(color: Color(0xFFA855F7), fontSize: 16)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(achievement, style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 14, height: 1.5)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PulsingDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: const BoxDecoration(
        color: Color(0xFFA855F7),
        shape: BoxShape.circle,
      ),
    )
    .animate(onPlay: (c) => c.repeat())
    .scale(
      begin: const Offset(1, 1),
      end: const Offset(1.5, 1.5),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    )
    .then()
    .scale(
      begin: const Offset(1.5, 1.5),
      end: const Offset(1, 1),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    )
    .custom(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                  color: const Color(0xFFA855F7).withValues(alpha: 0.5 * (1 - value)),
              blurRadius: 10 * value,
              spreadRadius: 5 * value,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

class _AboutSkillsSection extends StatelessWidget {
  const _AboutSkillsSection();

  @override
  Widget build(BuildContext context) {
    final skills = [
      {'name': 'Flutter & Dart', 'level': 90},
      {'name': 'State Management (GetX)', 'level': 85},
      {'name': 'Firebase Integration', 'level': 88},
      {'name': 'REST APIs', 'level': 90},
      {'name': 'Local Storage (Hive)', 'level': 85},
      {'name': 'CI/CD (GitHub Actions)', 'level': 80},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Technical Skills',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 40),
        ...List.generate(
          skills.length,
          (index) => _SkillBar(
            name: skills[index]['name'] as String,
            level: (skills[index]['level'] as int).toDouble(),
            index: index,
          ),
        ),
        const SizedBox(height: 40),
        const _AboutStatsGrid(),
      ],
    ).animate().fadeIn(
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 300),
    ).moveX(
      begin: 30,
      end: 0,
      duration: const Duration(milliseconds: 800),
      delay: const Duration(milliseconds: 300),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String name;
  final double level;
  final int index;

  const _SkillBar({
    required this.name,
    required this.level,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${level.toInt()}%',
                style: const TextStyle(
                  color: Color(0xFFC084FC),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: level / 100,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFA855F7), Color(0xFF06B6D4)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ).animate().scaleX(
                    begin: 0,
                    end: 1,
                    duration: const Duration(milliseconds: 1000),
                    delay: Duration(milliseconds: 500 + index * 100),
                    curve: Curves.easeOutQuart,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutStatsGrid extends StatelessWidget {
  const _AboutStatsGrid();

  @override
  Widget build(BuildContext context) {
    final stats = [
      {'value': '11+', 'label': 'Apps Deployed'},
      {'value': '1.3+', 'label': 'Years Experience'},
      {'value': '5M+', 'label': 'Active Users'},
      {'value': '40%', 'label': 'Performance Boost'},
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 2.2,
      children: List.generate(
        stats.length,
        (index) => _StatCard(
          value: stats[index]['value'] as String,
          label: stats[index]['label'] as String,
          index: index,
        ),
      ),
    );
  }
}

class _StatCard extends StatefulWidget {
  final String value;
  final String label;
  final int index;

  const _StatCard({
    required this.value,
    required this.label,
    required this.index,
  });

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child:
          AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFA855F7).withValues(alpha: isHovered ? 0.2 : 0.1),
                      const Color(0xFF06B6D4).withValues(alpha: isHovered ? 0.2 : 0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
            color: isHovered ? const Color(0xFFA855F7).withValues(alpha: 0.4) : const Color(0xFFA855F7).withValues(alpha: 0.2)),
                  boxShadow: isHovered ? [BoxShadow(color: const Color(0xFFA855F7).withValues(alpha: 0.1), blurRadius: 15, spreadRadius: 2)] : [],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFC084FC), Color(0xFF22D3EE)]).createShader(bounds),
                          child: Text(
                            widget.value,
                            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.label,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8), fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(
                duration: const Duration(milliseconds: 500),
                delay: Duration(milliseconds: 800 + widget.index * 100),
              )
              .scale(
                begin: const Offset(0.8, 0.8),
                end: const Offset(1, 1),
                duration: const Duration(milliseconds: 500),
                delay: Duration(milliseconds: 800 + widget.index * 100),
              ),
    );
  }
}
