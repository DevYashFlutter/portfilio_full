import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      color: AppColors.background,
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.purple, AppColors.cyan]).createShader(bounds),
            child: const Text(
              'Technical Expertise',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(
            width: 677,
            child: Text(
              'Cutting-edge technologies and frameworks I use to build exceptional mobile experiences',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: AppColors.textBody),
            ),
          ),
          const SizedBox(height: 64),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5,
            children: const [
              TechCard(title: 'Mobile', icon: Icons.phone_android_rounded, tags: ['Flutter', 'Dart'], usage: 0.95, gradient: [AppColors.purple, AppColors.magenta]),
              TechCard(title: 'Backend & Services', icon: Icons.cloud_queue_rounded, tags: ['Firebase', 'REST APIs'], usage: 0.90, gradient: [AppColors.cyan, AppColors.blue]),
              TechCard(title: 'Local Storage', icon: Icons.storage_rounded, tags: ['Hive', 'Shared Prefs'], usage: 0.85, gradient: [AppColors.blue, Color(0xFF615FFF)]),
              TechCard(title: 'DevOps', icon: Icons.alt_route_rounded, tags: ['GitHub Actions', 'CI/CD'], usage: 0.87, gradient: [Color(0xFF10B981), Color(0xFF3B82F6)]),
              TechCard(title: 'State Management', icon: Icons.layers_rounded, tags: ['GetX', 'Provider', 'Bloc'], usage: 0.92, gradient: [Color(0xFF6366F1), Color(0xFF0EA5E9)]),
              TechCard(title: 'Architecture', icon: Icons.hub_rounded, tags: ['Clean Architecture', 'MVVM'], usage: 0.88, gradient: [Color(0xFFEC4899), Color(0xFFA855F7)]),
            ],
          ),
        ],
      ),
    );
  }
}

class TechCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> tags;
  final double usage;
  final List<Color> gradient;

  const TechCard({super.key, required this.title, required this.icon, required this.tags, required this.usage, required this.gradient});

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
        curve: Curves.easeOutCubic,
        transform: isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        padding: const EdgeInsets.all(28),
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
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: widget.gradient),
                borderRadius: BorderRadius.circular(16),
                boxShadow: isHovered ? [BoxShadow(color: widget.gradient[0].withAlpha(100), blurRadius: 15)] : null,
              ),
              child: Icon(widget.icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Wrap(
              children: widget.tags
                  .map(
                    (tag) => Container(
                      margin: const EdgeInsets.only(right: 8, bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isHovered ? Colors.white.withAlpha(50) : Colors.white.withAlpha(25),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white.withAlpha(30)),
                      ),
                      child: Text(tag, style: const TextStyle(fontSize: 14, color: Colors.white)),
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Usage', style: TextStyle(fontSize: 14, color: AppColors.textBody)),
                Text(
                  '${(widget.usage * 100).toInt()}%',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textAccent),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E2939).withAlpha(153),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white.withAlpha(30)),
              ),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: widget.usage),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: value,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: widget.gradient),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
