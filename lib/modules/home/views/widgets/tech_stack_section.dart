import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;
    final bool isTablet = width < 1200 && width >= 850;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF020617), // slate-950
            Color(0xFF0F172A), // slate-900
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 40),
      child: Stack(
        children: [
          // 1. Background Grid Effect
          const _TechStackBackgroundGrid(),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // Section Header
                  const _SectionHeader(),
                  const SizedBox(height: 80),

                  // Technology Categories Grid
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 320,
                    ),
                    itemCount: techCategories.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final category = techCategories[index];
                      return _TechCategoryCard(
                        icon: category['icon'] as IconData,
                        category: category['category'] as String,
                        colors: category['colors'] as List<Color>,
                        technologies: category['technologies'] as List<Map<String, dynamic>>,
                        index: index,
                      );
                    },
                  ),
                  const SizedBox(height: 80),

                  // Master Stats Card
                  const _MasterStatsCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechStackBackgroundGrid extends StatelessWidget {
  const _TechStackBackgroundGrid();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.1,
        child: CustomPaint(
          painter: _GridPainter(),
        ),
      ).animate(onPlay: (c) => c.repeat()).custom(
            duration: const Duration(seconds: 20),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, value * 50),
                child: child,
              );
            },
          ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8B5CF6).withAlpha(51)
      ..strokeWidth = 1.0;

    const spacing = 50.0;

    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

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
            'Tech Stack',
            style: TextStyle(
              fontSize: isMobile ? 36 : 56,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ).animate().fadeIn(duration: const Duration(milliseconds: 800)).moveY(begin: 30, end: 0, duration: const Duration(milliseconds: 800)),
        const SizedBox(height: 16),
        Text(
          'Technologies I use to build exceptional mobile experiences',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 14 : 18,
            color: const Color(0xFF94A3B8), // slate-400
          ),
        ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200)),
      ],
    );
  }
}

class _TechCategoryCard extends StatefulWidget {
  final IconData icon;
  final String category;
  final List<Color> colors;
  final List<Map<String, dynamic>> technologies;
  final int index;

  const _TechCategoryCard({
    required this.icon,
    required this.category,
    required this.colors,
    required this.technologies,
    required this.index,
  });

  @override
  State<_TechCategoryCard> createState() => _TechCategoryCardState();
}

class _TechCategoryCardState extends State<_TechCategoryCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Stack(
          children: [
            // Hover Glow Effect
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isHovered ? 0.2 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ).animate(target: isHovered ? 1 : 0).blurXY(begin: 0, end: 40),
            ),

            // Main Card
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                                color: const Color(0xFF0F172A).withAlpha(127),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isHovered
                          ? widget.colors.first.withAlpha(102) : const Color(0xFFA855F7).withAlpha(51),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: widget.colors,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              widget.icon,
                              color: Colors.white,
                              size: 24,
                            ),
                          ).animate(target: isHovered ? 1 : 0).rotate(begin: 0, end: 1, duration: const Duration(milliseconds: 600), curve: Curves.easeInOut),
                          const SizedBox(width: 16),
                          Text(
                            widget.category,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Tech List
                      ...widget.technologies.expand((tech) => [
                            _SkillRow(
                              name: tech['name'] as String,
                              usage: (tech['usage'] as int).toDouble(),
                              colors: widget.colors,
                            ),
                            const SizedBox(height: 20),
                          ]),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Right Indicator
            Positioned(
              bottom: 16,
              right: 16,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isHovered ? 0.2 : 0.0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: widget.colors),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ).animate(target: isHovered ? 1 : 0).moveY(begin: 0, end: -8, duration: const Duration(milliseconds: 300)).scale(begin: const Offset(1, 1), end: const Offset(1.02, 1.02), duration: const Duration(milliseconds: 300)),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: widget.index * 100),
        ).scale(
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: widget.index * 100),
        );
  }
}

class _SkillRow extends StatelessWidget {
  final String name;
  final double usage;
  final List<Color> colors;

  const _SkillRow({
    required this.name,
    required this.usage,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Color(0xFFCBD5E1), // slate-300
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFA855F7).withAlpha(26),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${usage.toInt()}%',
                style: const TextStyle(
                  color: Color(0xFFC084FC),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: usage / 100,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors),
                borderRadius: BorderRadius.circular(3),
              ),
            ).animate().scaleX(
                  begin: 0,
                  end: 1,
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 500),
                  curve: Curves.easeOutQuart,
                ),
          ),
        ),
      ],
    );
  }
}

class _MasterStatsCard extends StatelessWidget {
  const _MasterStatsCard();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFA855F7).withAlpha(26), const Color(0xFF06B6D4).withAlpha(26),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFA855F7).withAlpha(51),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: isMobile
              ? Column(
                  children: [
                        _buildStatItem('10+', 'Technologies Mastered', [const Color(0xFFC084FC), const Color(0xFF22D3EE)]),
                    const SizedBox(height: 32),
                        _buildStatItem('100+', 'APIs Integrated', [const Color(0xFF22D3EE), const Color(0xFF60A5FA)]),
                    const SizedBox(height: 32),
                        _buildStatItem('99.9%', 'App Stability', [const Color(0xFF60A5FA), const Color(0xFFC084FC)]),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                        _buildStatItem('10+', 'Technologies Mastered', [const Color(0xFFC084FC), const Color(0xFF22D3EE)]),
                        _buildStatItem('100+', 'APIs Integrated', [const Color(0xFF22D3EE), const Color(0xFF60A5FA)]),
                        _buildStatItem('99.9%', 'App Stability', [const Color(0xFF60A5FA), const Color(0xFFC084FC)]),
                  ],
                ),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 600)).moveY(begin: 30, end: 0, duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 600));
  }

  Widget _buildStatItem(String value, String label, List<Color> colors) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: colors).createShader(bounds),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF94A3B8), // slate-400
          ),
        ),
      ],
    );
  }
}

final List<Map<String, dynamic>> techCategories = [
  {
    'icon': Icons.smartphone_rounded,
    'category': 'Mobile',
    'colors': [const Color(0xFF3B82F6), const Color(0xFF6366F1)],
    'technologies': [
      {'name': 'Flutter', 'usage': 95},
      {'name': 'Dart', 'usage': 95},
    ],
  },
  {
    'icon': Icons.layers_rounded,
    'category': 'State Management',
    'colors': [const Color(0xFF8B5CF6), const Color(0xFFEC4899)],
    'technologies': [
      {'name': 'GetX', 'usage': 90},
      {'name': 'Provider', 'usage': 75},
    ],
  },
  {
    'icon': Icons.cloud_rounded,
    'category': 'Backend & Services',
    'colors': [const Color(0xFF10B981), const Color(0xFF059669)],
    'technologies': [
      {'name': 'Firebase', 'usage': 88},
      {'name': 'REST APIs', 'usage': 92},
    ],
  },
  {
    'icon': Icons.storage_rounded,
    'category': 'Local Storage',
    'colors': [const Color(0xFFF97316), const Color(0xFFEF4444)],
    'technologies': [
      {'name': 'Hive', 'usage': 85},
      {'name': 'SQLite', 'usage': 70},
    ],
  },
  {
    'icon': Icons.account_tree_rounded,
    'category': 'DevOps',
    'colors': [const Color(0xFF06B6D4), const Color(0xFF3B82F6)],
    'technologies': [
      {'name': 'GitHub Actions', 'usage': 80},
      {'name': 'Fastlane', 'usage': 65},
    ],
  },
  {
    'icon': Icons.memory_rounded,
    'category': 'Tools & Others',
    'colors': [const Color(0xFF7C3AED), const Color(0xFF8B5CF6)],
    'technologies': [
      {'name': 'Git', 'usage': 90},
      {'name': 'VS Code', 'usage': 95},
    ],
  },
];
