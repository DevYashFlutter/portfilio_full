import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:portfolio/modules/home/views/widgets/premium_hover_card.dart';
import 'package:portfolio/utils/responsive.dart';

class ResponsibilitiesSection extends StatelessWidget {
  const ResponsibilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsibilities = [
      {'icon': Icons.rocket_launch_rounded, 'text': 'Lead development of cross-platform mobile applications'},
      {'icon': Icons.architecture_rounded, 'text': 'Architect scalable solutions for high-traffic applications'},
      {'icon': Icons.layers_rounded, 'text': 'Implement state management patterns (GetX, Provider, Bloc)'},
      {'icon': Icons.api_rounded, 'text': 'Integrate REST APIs and Firebase services'},
      {'icon': Icons.bug_report_rounded, 'text': 'Write comprehensive unit and widget tests'},
      {'icon': Icons.code_rounded, 'text': 'Code review and maintain coding standards'},
      {'icon': Icons.groups_rounded, 'text': 'Collaborate with designers and product managers'},
      {'icon': Icons.speed_rounded, 'text': 'Optimize app performance and user experience'},
    ];

    return Stack(
      children: [
        // Background
        Positioned.fill(
          child: Container(
            color: const Color(0xFF020617), // slate-950
          ),
        ),

        // Animated background grid
        Positioned.fill(
          child: Opacity(opacity: 0.1, child: CustomPaint(painter: _ResponsibilityGridPainter())),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(children: [_buildHeader(context), const SizedBox(height: 48), _buildResponsibilitiesGrid(context, responsibilities)]),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
            child: Text(
              'Core Responsibilities',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: isMobile ? 32 : 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3, end: 0),
          const SizedBox(height: 12),
          Text(
            'Driving excellence across the entire development lifecycle',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isMobile ? 14 : 16, color: const Color(0xFF94A3B8)),
          ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideY(begin: 0.3, end: 0),
        ],
      ),
    );
  }

  Widget _buildResponsibilitiesGrid(BuildContext context, List<Map<String, dynamic>> items) {
    final bool isMobile = Responsive.isMobile(context);

    int crossAxisCount = 2;
    if (isMobile) crossAxisCount = 1;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      constraints: BoxConstraints(maxWidth: double.infinity),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: (Get.width - 1000) / 2),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          mainAxisExtent: 80, // Compact height
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _ResponsibilityCard(
            icon: item['icon'] as IconData,
            text: item['text'] as String,
            index: index,
          ).animate().fadeIn(duration: 600.ms, delay: (index * 100).ms).slideX(begin: index % 2 == 0 ? -0.1 : 0.1, end: 0);
        },
      ),
    );
  }
}

class _ResponsibilityCard extends StatefulWidget {
  final IconData icon;
  final String text;
  final int index;

  const _ResponsibilityCard({required this.icon, required this.text, required this.index});

  @override
  State<_ResponsibilityCard> createState() => _ResponsibilityCardState();
}

class _ResponsibilityCardState extends State<_ResponsibilityCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return PremiumHoverCard(
      borderRadius: 16,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A).withAlpha(153), // slate-900/60
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isHovered ? const Color(0xFFA855F7).withAlpha(102) : const Color(0xFF334155).withAlpha(51)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: isHovered ? const Color(0xFFA855F7).withAlpha(51) : const Color(0xFF1E293B), borderRadius: BorderRadius.circular(8)),
                child: Icon(widget.icon, size: 20, color: isHovered ? const Color(0xFF22D3EE) : const Color(0xFFA855F7)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.text,
                  style: TextStyle(fontSize: 14, color: isHovered ? Colors.white : const Color(0xFF94A3B8), height: 1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResponsibilityGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFA855F7).withAlpha(40)
      ..strokeWidth = 1.0;

    const double step = 100;

    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
