import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/views/widgets/premium_hover_card.dart';
import 'package:portfolio/utils/portfolio_data.dart';
import 'package:portfolio/utils/responsive.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background with Gradients and Grid
        Positioned.fill(
          child: Container(
            color: const Color(0xFF020617), // slate-950
          ),
        ),

        // Animated background grid
        Positioned.fill(
          child: Opacity(opacity: 0.1, child: CustomPaint(painter: _ExperienceGridPainter())),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(children: [_buildHeader(context), const SizedBox(height: 48), _buildExperienceList(context)]),
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
              'Professional Experience',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: isMobile ? 32 : 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3, end: 0),
          const SizedBox(height: 12),
          Text(
            '2.6+ years building impactful mobile applications',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isMobile ? 14 : 16, color: const Color(0xFF94A3B8)),
          ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideY(begin: 0.3, end: 0),
        ],
      ),
    );
  }

  Widget _buildExperienceList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: Column(
        children: PortfolioData.experience.asMap().entries.map((entry) {
          return _ExperienceCard(data: entry.value, index: entry.key).animate().fadeIn(duration: 600.ms, delay: (entry.key * 200).ms).slideY(begin: 0.2, end: 0);
        }).toList(),
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final int index;

  const _ExperienceCard({required this.data, required this.index});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (Get.width - 900) / 2),
      child: PremiumHoverCard(
        borderRadius: 20,
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A).withAlpha(153), // slate-900 with opacity
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isHovered ? const Color(0xFFA855F7).withAlpha(102) : const Color(0xFF64748B).withAlpha(51)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Role and Period
                if (isMobile) ...[
                  Text(
                    widget.data['role'] as String,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.data['company'] as String,
                    style: const TextStyle(fontSize: 16, color: Color(0xFFA855F7), fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  _buildMetaInfo(Icons.calendar_today_rounded, widget.data['period'] as String),
                ] else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data['role'] as String,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.data['company'] as String,
                              style: const TextStyle(fontSize: 18, color: Color(0xFFA855F7), fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildMetaInfo(Icons.calendar_today_rounded, widget.data['period'] as String),
                          const SizedBox(height: 4),
                          _buildMetaInfo(Icons.location_on_rounded, widget.data['location'] as String),
                        ],
                      ),
                    ],
                  ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(color: Color(0xFF334155), height: 1),
                ),

                // Description (Compact)
                Text(widget.data['description'] as String, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13, height: 1.5)),
                const SizedBox(height: 24),

                // Contributions
                const Text(
                  'Key Contributions',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
                ),
                const SizedBox(height: 12),
                ...(widget.data['contributions'] as List<String>).map((c) => _CompactContribution(text: c)),

                const SizedBox(height: 24),

                // Stats Section
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: (widget.data['stats'] as List<Map<String, String>>).map((s) {
                      return _CompactStat(label: s['label']!, sub: s['subLabel']!);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetaInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: const Color(0xFF22D3EE)),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
      ],
    );
  }
}

class _CompactContribution extends StatelessWidget {
  final String text;
  const _CompactContribution({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.check_circle_outline_rounded, size: 14, color: Color(0xFF22D3EE)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 13, color: Color(0xFFCBD5E1), height: 1.4)),
          ),
        ],
      ),
    );
  }
}

class _CompactStat extends StatelessWidget {
  final String label;
  final String sub;

  const _CompactStat({required this.label, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withAlpha(128),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF22D3EE)),
          ),
          Text(sub, style: const TextStyle(fontSize: 10, color: Color(0xFF64748B))),
        ],
      ),
    );
  }
}

class _ExperienceGridPainter extends CustomPainter {
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
