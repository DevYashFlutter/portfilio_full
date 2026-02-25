import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/portfolio_data.dart';
import 'premium_hover_card.dart';

class AnimationsSection extends StatefulWidget {
  const AnimationsSection({super.key});

  @override
  State<AnimationsSection> createState() => _AnimationsSectionState();
}

class _AnimationsSectionState extends State<AnimationsSection> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> features = [
    {
      'title': 'Micro-interactions',
      'desc': 'Subtle animations that enhance user experience',
      'icon': Icons.auto_awesome_rounded,
      'color': Color(0xFFEC4899),
    },
    {
      'title': 'Transitions',
      'desc': 'Smooth page and component transitions',
      'icon': Icons.bolt_rounded,
      'color': Color(0xFF0EA5E9),
    },
    {
      'title': 'Gesture Driven',
      'desc': 'Interactive swipe and drag animations',
      'icon': Icons.gesture_rounded,
      'color': Color(0xFF10B981),
    },
    {
      'title': 'Physics Based',
      'desc': 'Natural spring and decay animations',
      'icon': Icons.waves_rounded,
      'color': Color(0xFFF97316),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A),
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Header
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                child: Text(
                  'Animation Showcase',
                  style: TextStyle(fontSize: isMobile ? 36 : 56, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Bringing apps to life with smooth, performant animations',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 14 : 18, color: Colors.white.withAlpha(150)),
              ),
              const SizedBox(height: 80),

              // Showcase Content
              isMobile
                  ? Column(
                      children: [
                        _buildDemoArea(isMobile),
                        const SizedBox(height: 48),
                        _buildFeatureList(isMobile),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 6, child: _buildDemoArea(isMobile)),
                        const SizedBox(width: 48),
                        Expanded(flex: 4, child: _buildFeatureList(isMobile)),
                      ],
                    ),

              const SizedBox(height: 80),

              // Bottom Stats
              GridView.count(
                crossAxisCount: isMobile ? 2 : 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 1.5 : 2.5,
                children: const [
                  _StatItem(value: '60 FPS', label: 'Smooth'),
                  _StatItem(value: 'Custom', label: 'Animations'),
                  _StatItem(value: 'Hero', label: 'Transitions'),
                  _StatItem(value: 'Gesture', label: 'Based'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDemoArea(bool isMobile) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withAlpha(150),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(10)),
      ),
      child: Stack(
        children: [
          // Background decorative elements (Staggered Grid)
          Center(
            child: SizedBox(
              width: 320,
              height: 240,
              child: Stack(
                children: List.generate(12, (index) {
                  final row = index ~/ 4;
                  final col = index % 4;
                  return Positioned(
                    left: col * 80.0 + (row % 2 == 0 ? 0 : 20),
                    top: row * 80.0,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            (features[selectedIndex]['color'] as Color).withAlpha(30),
                            (features[selectedIndex]['color'] as Color).withAlpha(5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: (features[selectedIndex]['color'] as Color).withAlpha(20)),
                      ),
                    ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
                          duration: Duration(seconds: 2 + index % 2),
                          begin: const Offset(0.8, 0.8),
                          end: const Offset(1.1, 1.1),
                        ),
                  );
                }),
              ),
            ),
          ),
          // Main Interactive Icon
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [features[selectedIndex]['color'], (features[selectedIndex]['color'] as Color).withAlpha(150)],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: (features[selectedIndex]['color'] as Color).withAlpha(150), blurRadius: 40, spreadRadius: 5),
                ],
              ),
              child: Icon(features[selectedIndex]['icon'], color: Colors.white, size: 60),
            ).animate(key: ValueKey(selectedIndex)).scale(duration: const Duration(milliseconds: 400), curve: Curves.easeOutBack).shimmer(duration: const Duration(seconds: 2)),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A).withAlpha(200),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withAlpha(10)),
                ),
                child: Text(
                  'Interactive Demo - Hover & Click',
                  style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureList(bool isMobile) {
    return Column(
      children: List.generate(
        features.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _FeatureCard(
            feature: features[index],
            isSelected: selectedIndex == index,
            onTap: () => setState(() => selectedIndex = index),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final Map<String, dynamic> feature;
  final bool isSelected;
  final VoidCallback onTap;

  const _FeatureCard({required this.feature, required this.isSelected, required this.onTap});

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return PremiumHoverCard(
      borderRadius: 16,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.isSelected ? (widget.feature['color'] as Color).withAlpha(40) : Colors.white.withAlpha(5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: widget.isSelected ? (widget.feature['color'] as Color).withAlpha(100) : Colors.white.withAlpha(10)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (widget.feature['color'] as Color).withAlpha(50),
                    borderRadius: BorderRadius.circular(12),
                  ),
                    child: Icon(
                      widget.feature['icon'] as IconData,
                      color: widget.feature['color'] as Color,
                      size: 20,
                    ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.feature['title'] as String,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.feature['desc'] as String,
                        style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 10),
                      ),
                    ],
                  ),
                ),
                if (widget.isSelected) const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return PremiumHoverCard(
      borderRadius: 16,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withAlpha(150),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withAlpha(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 6),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.white.withAlpha(120), fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
