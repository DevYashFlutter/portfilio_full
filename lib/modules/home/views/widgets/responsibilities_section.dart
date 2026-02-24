import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';

class ResponsibilitiesSection extends StatelessWidget {
  const ResponsibilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    final responsibilities = [
      'Lead development of cross-platform mobile applications',
      'Architect scalable solutions for high-traffic applications',
      'Implement state management patterns (GetX, Provider, Bloc)',
      'Integrate REST APIs and Firebase services',
      'Write comprehensive unit and widget tests',
      'Code review and maintain coding standards',
      'Collaborate with designers and product managers',
      'Optimize app performance and user experience',
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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(isMobile ? 24 : 32),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1B4B).withAlpha(102),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withAlpha(25)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.work_outline_rounded, size: 24, color: Colors.white),
                          const SizedBox(width: 12),
                          Text(
                            'Core Responsibilities',
                            style: TextStyle(fontSize: isMobile ? 20 : 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: isMobile ? 32 : 48),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: responsibilities.map((text) {
                          return _ResponsibilityTile(text: text);
                        }).toList(),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResponsibilityTile extends StatefulWidget {
  final String text;

  const _ResponsibilityTile({required this.text});

  @override
  State<_ResponsibilityTile> createState() => _ResponsibilityTileState();
}

class _ResponsibilityTileState extends State<_ResponsibilityTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;
    final bool isTablet = width < 1200 && width >= 850;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isMobile ? double.infinity : (isTablet ? (width - 150) / 2 : 540),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: isHovered ? Colors.white.withAlpha(30) : Colors.white.withAlpha(13),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isHovered ? const Color(0xFF22D3EE).withAlpha(100) : Colors.white.withAlpha(20)),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(color: Color(0xFFA855F7), shape: BoxShape.circle),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(widget.text, style: TextStyle(fontSize: 14, color: isHovered ? Colors.white : AppColors.textBody.withAlpha(200))),
            ),
          ],
        ),
      ),
    );
  }
}
