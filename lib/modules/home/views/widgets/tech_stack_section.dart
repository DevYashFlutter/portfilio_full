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

    final List<Map<String, dynamic>> techStacks = [
      {
        'title': 'Mobile',
        'icon': Icons.phone_android_rounded,
        'tags': ['Flutter', 'Dart'],
        'usage': 0.95,
        'color': AppColors.purple,
      },
      {
        'title': 'Backend',
        'icon': Icons.cloud_queue_rounded,
        'tags': ['Firebase', 'REST APIs'],
        'usage': 0.90,
        'color': AppColors.cyan,
      },
      {
        'title': 'Storage',
        'icon': Icons.storage_rounded,
        'tags': ['Hive', 'Shared Prefs'],
        'usage': 0.85,
        'color': AppColors.blue,
      },
      {
        'title': 'DevOps',
        'icon': Icons.alt_route_rounded,
        'tags': ['GitHub Actions', 'CI/CD'],
        'usage': 0.87,
        'color': const Color(0xFF10B981),
      },
      {
        'title': 'State Mgmt',
        'icon': Icons.layers_rounded,
        'tags': ['GetX', 'Provider', 'Bloc'],
        'usage': 0.92,
        'color': const Color(0xFF6366F1),
      },
      {
        'title': 'Architecture',
        'icon': Icons.hub_rounded,
        'tags': ['Clean Architecture', 'SOLID'],
        'usage': 0.88,
        'color': const Color(0xFFEC4899),
      },
    ];

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: isMobile ? 24 : 40),
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                  child: Text(
                    'Tech Stack',
                    style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800)),
                const SizedBox(height: 16),
                Text(
                  'Tools I use to build scalable applications',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 14 : 16, color: AppColors.textBody.withAlpha(150)),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200)),
                const SizedBox(height: 60),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: isMobile ? 1.4 : 1.2,
                  ),
                  itemCount: techStacks.length,
                  itemBuilder: (context, index) => TechCard(tech: techStacks[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TechCard extends StatefulWidget {
  final Map<String, dynamic> tech;
  const TechCard({super.key, required this.tech});

  @override
  State<TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<TechCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF1E1B4B) : const Color(0xFF1E1B4B).withAlpha(102),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isHovered ? (widget.tech['color'] as Color).withAlpha(127) : Colors.white.withAlpha(25)),
          boxShadow: isHovered ? [BoxShadow(color: (widget.tech['color'] as Color).withAlpha(25), blurRadius: 20, spreadRadius: 2)] : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: (widget.tech['color'] as Color).withAlpha(25), borderRadius: BorderRadius.circular(10)),
                  child: Icon(widget.tech['icon'] as IconData, color: widget.tech['color'] as Color, size: 24),
                ),
                const Spacer(),
                Text(
                  '${(widget.tech['usage'] * 100).toInt()}%',
                  style: TextStyle(color: widget.tech['color'] as Color, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.tech['title'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8, runSpacing: 8, children: (widget.tech['tags'] as List<String>).map((tag) => _Tag(tag: tag)).toList(),
            ),
            const Spacer(),
            Container(
              height: 6,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white.withAlpha(13), borderRadius: BorderRadius.circular(3)),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: widget.tech['usage'] as double,
                child: Container(
                  decoration: BoxDecoration(color: widget.tech['color'] as Color, borderRadius: BorderRadius.circular(3)),
                ),
              ).animate().scaleX(duration: const Duration(milliseconds: 1500), curve: Curves.easeOutCubic),
            ),
          ],
        ),
      ).animate().fadeIn(duration: const Duration(milliseconds: 800)),
    );
  }
}

class _Tag extends StatelessWidget {
  final String tag;
  const _Tag({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withAlpha(13)),
      ),
      child: Text(tag, style: const TextStyle(color: Colors.white70, fontSize: 11)),
    );
  }
}
