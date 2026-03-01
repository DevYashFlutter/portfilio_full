import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'premium_hover_card.dart';
import 'package:portfolio/utils/portfolio_data.dart';

class ProjectsSection extends StatefulWidget {
  final String? title;
  final String? type;

  const ProjectsSection({super.key, this.title, this.type});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  late String selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.type == 'personal' ? 'Personal' : 'Industrial';
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    final industrialProjects = PortfolioData.industryProjects;
    final personalProjects = PortfolioData.personalProjects;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF0F172A), Color(0xFF020617), Color(0xFF0F172A)]),
      ),
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 40),
      child: Stack(
        children: [
          // Background animated spheres
          Positioned(
            top: 100,
            left: width * 0.2,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFF22D3EE).withValues(alpha: 0.1)),
            ).animate(onPlay: (c) => c.repeat()).scale(begin: const Offset(1, 1), end: const Offset(1.3, 1.3), duration: const Duration(seconds: 10), curve: Curves.easeInOut),
          ),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // Section Header
                  Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                        child: Text(
                          'Project Showcase',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: isMobile ? 36 : 56, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Production apps serving millions of users worldwide',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          color: const Color(0xFF94A3B8), // slate-400
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 800.ms).moveY(begin: 30, end: 0),
                  const SizedBox(height: 50),

                  // Filter Tabs
                  Container(
                    width: isMobile ? double.infinity : 450,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFA855F7).withValues(alpha: 0.2)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _FilterTab(
                            label: 'Industry Projects (${industrialProjects.length})',
                            isSelected: selectedType == 'Industrial',
                            onTap: () => setState(() => selectedType = 'Industrial'),
                          ),
                        ),
                        Expanded(
                          child: _FilterTab(
                            label: 'Personal Projects (${personalProjects.length})',
                            isSelected: selectedType == 'Personal',
                            onTap: () => setState(() => selectedType = 'Personal'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),

                  // Projects Grid
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final projectList = _getFilteredProjects(industrialProjects, personalProjects);
                      final int columns = isMobile ? 1 : (width < 1200 ? 2 : 3);
                      final double spacing = 24.0;
                      final double itemWidth = (constraints.maxWidth - (spacing * (columns - 1))) / columns;

                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: projectList.map((project) {
                          return SizedBox(
                            width: itemWidth,
                            child: _ProjectCard(
                              title: project['title'],
                              description: project['desc'],
                              tags: List<String>.from(project['tags']),
                              users: project['users'] ?? '0',
                              rating: project['rating'] ?? '5.0',
                              perf: project['perf'] ?? 'N/A',
                              colors: List<Color>.from(project['colors']),
                              category: project['category'],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<dynamic> _getFilteredProjects(List<dynamic> industrial, List<dynamic> personal) {
    if (selectedType == 'Personal') return personal;
    return industrial; // Default to Industrial if "All" is removed or not selected
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterTab({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: isSelected ? const LinearGradient(colors: [Color(0x33A855F7), Color(0x3322D3EE)]) : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF94A3B8), // slate-400
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 13,
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
  final String perf;
  final List<Color> colors;
  final String category;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tags,
    required this.users,
    required this.rating,
    required this.perf,
    required this.colors,
    required this.category,
  });

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
      child: PremiumHoverCard(
        borderRadius: 24,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isHovered ? widget.colors.first.withValues(alpha: 0.4) : Colors.white.withValues(alpha: 0.1), width: 1,
            ),
          ),
          child: Stack(
            children: [
              // Glow effect
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: isHovered ? 0.2 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [BoxShadow(color: widget.colors.first, blurRadius: 40, spreadRadius: -10)],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Phone mockup placeholder
                    Container(
                      height: 192,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(16)),
                      child: Stack(
                        children: [
                          Center(
                            child: AnimatedScale(
                              scale: isHovered ? 1.05 : 1.0,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                width: 128,
                                height: 160,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft, end: Alignment.bottomRight, colors: widget.colors),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
                                ),
                                child: Icon(Icons.smartphone_rounded, size: 64, color: Colors.white.withValues(alpha: 0.5)),
                              ),
                            ),
                          ),
                          // Floating category badge
                          Positioned(
                            top: 16,
                            right: 16,
                            child: _FloatingBadge(label: widget.category, color: widget.colors.first),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Project info
                    Text(
                      widget.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF94A3B8), // slate-400
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Tech stack
                    Wrap(spacing: 8, runSpacing: 8, children: widget.tags.map((tag) => _TechBadge(label: tag)).toList()),
                    const SizedBox(height: 16),

                    // Metrics
                    Row(
                      children: [
                        _StatBox(icon: Icons.people_outline_rounded, label: 'Users', value: widget.users, color: Colors.purple.shade400),
                        const SizedBox(width: 12),
                        _StatBox(icon: Icons.trending_up_rounded, label: 'Rating', value: widget.rating, color: Colors.cyan.shade400),
                        const SizedBox(width: 12),
                        _StatBox(icon: Icons.speed_rounded, label: 'Perf', value: widget.perf, color: Colors.blue.shade400),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // CTA Button
                    _CTAButton(isHovered: isHovered, colors: widget.colors),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 50.ms);
  }
}

class _FloatingBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _FloatingBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 12, fontWeight: FontWeight.w500,
        ),
      ),
    ).animate(onPlay: (controller) => controller.repeat(reverse: true)).moveY(begin: 0, end: -5, duration: const Duration(seconds: 2), curve: Curves.easeInOut,
        );
  }
}

class _TechBadge extends StatelessWidget {
  final String label;
  const _TechBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFA855F7).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFA855F7).withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFFD8B4FE), fontSize: 12),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatBox({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8))), // slate-400
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _CTAButton extends StatelessWidget {
  final bool isHovered;
  final List<Color> colors;

  const _CTAButton({required this.isHovered, required this.colors});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isHovered ? colors.first.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.1)),
        gradient: isHovered ? LinearGradient(colors: [colors.first.withValues(alpha: 0.2), colors.last.withValues(alpha: 0.2)]) : null,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'View Details',
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 8),
            Icon(Icons.open_in_new_rounded, size: 14, color: Colors.white.withValues(alpha: 0.7)),
          ],
        ),
      ),
    );
  }
}
