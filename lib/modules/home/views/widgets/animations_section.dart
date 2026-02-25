import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationsSection extends StatefulWidget {
  const AnimationsSection({super.key});

  @override
  State<AnimationsSection> createState() => _AnimationsSectionState();
}

class _AnimationsSectionState extends State<AnimationsSection> {
  int activeDemo = 0;

  final List<Map<String, dynamic>> animationDemos = [
    {
      'title': 'Micro-interactions',
      'description': 'Subtle animations that enhance user experience',
      'icon': Icons.auto_awesome_rounded,
      'colorStart': const Color(0xFFA855F7),
      'colorEnd': const Color(0xFFEC4899),
    },
    {
      'title': 'Transitions',
      'description': 'Smooth page and component transitions',
      'icon': Icons.bolt_rounded,
      'colorStart': const Color(0xFF06B6D4),
      'colorEnd': const Color(0xFF3B82F6),
    },
    {
      'title': 'Gesture Driven',
      'description': 'Interactive swipe and drag animations',
      'icon': Icons.air_rounded,
      'colorStart': const Color(0xFF22C55E),
      'colorEnd': const Color(0xFF10B981),
    },
    {
      'title': 'Physics Based',
      'description': 'Natural spring and decay animations',
      'icon': Icons.waves_rounded,
      'colorStart': const Color(0xFFF97316),
      'colorEnd': const Color(0xFFEF4444),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 1024;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFF0F172A)),
      child: Stack(
        children: [
          // Animated background orb
          Positioned(
            top: 100,
            right: width * 0.1,
            child:
                Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFA855F7).withAlpha(20)),
                    )
                    .animate(onPlay: (c) => c.repeat())
                    .move(duration: 15.seconds, begin: const Offset(0, 0), end: const Offset(100, -50), curve: Curves.easeInOut)
                    .then()
                    .move(duration: 15.seconds, begin: const Offset(100, -50), end: const Offset(0, 0), curve: Curves.easeInOut)
                    .scale(duration: 15.seconds, begin: const Offset(1, 1), end: const Offset(1.2, 1.2), curve: Curves.easeInOut)
                    .blur(begin: const Offset(80, 80), end: const Offset(100, 100)),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 96, horizontal: isMobile ? 24 : 64),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    // Header
                    Column(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                          child: Text(
                            'Animation Showcase',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: isMobile ? 36 : 48, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -1),
                          ),
                        ).animate().fadeIn(duration: 800.ms).moveY(begin: 30, end: 0),
                        const SizedBox(height: 16),
                        Text(
                          'Bringing apps to life with smooth, performant animations',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: isMobile ? 16 : 18, color: const Color(0xFF94A3B8)),
                        ).animate().fadeIn(duration: 800.ms, delay: 200.ms).moveY(begin: 30, end: 0),
                      ],
                    ),
                    const SizedBox(height: 64),

                    // Main Content Grid
                    isMobile
                        ? Column(children: [_buildDemoArea(width, isMobile), const SizedBox(height: 48), _buildFeatureList()])
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 1, child: _buildDemoArea(width, isMobile)),
                              const SizedBox(width: 48),
                              Expanded(flex: 1, child: _buildFeatureList()),
                            ],
                          ),

                    const SizedBox(height: 64),

                    // Footer Stats
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 24,
                          runSpacing: 24,
                          children: [
                            _buildStatItem('60 FPS', 'Smooth', constraints.maxWidth),
                            _buildStatItem('Custom', 'Animations', constraints.maxWidth),
                            _buildStatItem('Hero', 'Transitions', constraints.maxWidth),
                            _buildStatItem('Gesture', 'Based', constraints.maxWidth),
                          ],
                        );
                      },
                    ).animate().fadeIn(duration: 800.ms, delay: 400.ms).moveY(begin: 30, end: 0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoArea(double screenWidth, bool isMobile) {
    final demo = animationDemos[activeDemo];
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withAlpha(127),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFA855F7).withAlpha(51)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Floating background elements
            ...List.generate(12, (index) {
              final row = index ~/ 4;
              final col = index % 4;
              return Positioned(
                left: col * (isMobile ? 60.0 : 80.0) + (isMobile ? 20 : 60),
                top: row * 80.0 + 60,
                child:
                    Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [demo['colorStart'].withAlpha(51), demo['colorEnd'].withAlpha(51)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        )
                        .animate(onPlay: (c) => c.repeat())
                        .moveY(duration: (3 + index * 0.2).seconds, begin: 0, end: -20, curve: Curves.easeInOut)
                        .then()
                        .moveY(duration: (3 + index * 0.2).seconds, begin: -20, end: 0, curve: Curves.easeInOut)
                        .rotate(duration: (3 + index * 0.2).seconds, begin: 0, end: 1)
                        .scale(duration: (3 + index * 0.2).seconds, begin: const Offset(1, 1), end: const Offset(1.2, 1.2), curve: Curves.easeInOut),
              );
            }),

            // Center Showcase element
            Center(
              child: _ShowcaseIcon(icon: demo['icon'], colorStart: demo['colorStart'], colorEnd: demo['colorEnd'], key: ValueKey(activeDemo)),
            ),

            // Demo Label
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A).withAlpha(204),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: const Color(0xFFA855F7).withAlpha(76)),
                  ),
                  child: const Text('Interactive Demo - Hover & Click', style: TextStyle(color: Color(0xFFD8B4FE), fontSize: 14)),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 800.ms).moveX(begin: -30, end: 0);
  }

  Widget _buildFeatureList() {
    return Column(
      children: List.generate(
        animationDemos.length,
        (index) => _FeatureCard(demo: animationDemos[index], isActive: activeDemo == index, onTap: () => setState(() => activeDemo = index), delay: (index * 100).ms),
      ),
    ).animate().fadeIn(duration: 800.ms).moveX(begin: 30, end: 0);
  }

  Widget _buildStatItem(String label, String value, double maxWidth) {
    final double cardWidth = maxWidth > 640 ? (maxWidth - 72) / 4 : (maxWidth - 24) / 2;
    return Container(
      width: cardWidth,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withAlpha(127),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFA855F7).withAlpha(51)),
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
            child: Text(
              label,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14)),
        ],
      ),
    ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack);
  }
}

class _ShowcaseIcon extends StatefulWidget {
  final IconData icon;
  final Color colorStart;
  final Color colorEnd;

  const _ShowcaseIcon({super.key, required this.icon, required this.colorStart, required this.colorEnd});

  @override
  State<_ShowcaseIcon> createState() => _ShowcaseIconState();
}

class _ShowcaseIconState extends State<_ShowcaseIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.1 : 1.0,
        duration: 300.ms,
        curve: Curves.easeOutBack,
        child: AnimatedRotation(
          turns: isHovered ? 1.0 : 0.0,
          duration: 600.ms,
          curve: Curves.easeOutBack,
          child: Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [widget.colorStart, widget.colorEnd]),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [BoxShadow(color: widget.colorStart.withAlpha(127), blurRadius: 32, spreadRadius: 8)],
            ),
            child: Icon(widget.icon, color: Colors.white, size: 64),
          ),
        ),
      ),
    ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack);
  }
}

class _FeatureCard extends StatefulWidget {
  final Map<String, dynamic> demo;
  final bool isActive;
  final VoidCallback onTap;
  final Duration delay;

  const _FeatureCard({required this.demo, required this.isActive, required this.onTap, required this.delay});

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: 300.ms,
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: widget.isActive ? const Color(0xFFA855F7).withAlpha(38) : const Color(0xFF1E293B).withAlpha(76),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: widget.isActive ? const Color(0xFFA855F7).withAlpha(127) : const Color(0xFFA855F7).withAlpha(51), width: widget.isActive ? 2 : 1),
          ),
          transform: Matrix4.translationValues(isHovered ? 8 : 0, 0, 0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [widget.demo['colorStart'], widget.demo['colorEnd']]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.demo['icon'], color: Colors.white, size: 24),
              ).animate(onPlay: (c) => isHovered ? c.repeat() : c.stop()).rotate(duration: 600.ms),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.demo['title'],
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(widget.demo['description'], style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14)),
                  ],
                ),
              ),
              if (widget.isActive)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Color(0xFFA855F7), shape: BoxShape.circle),
                ).animate().scale(duration: 300.ms),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: widget.delay).moveX(begin: 30, end: 0);
  }
}
