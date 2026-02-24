import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'dart:math' as math;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 850,
      decoration: const BoxDecoration(color: AppColors.background),
      child: Stack(
        children: [
          // Moving Dots Background
          const FloatingDots(),

          // Floating Interactive Assets
          const FloatingAsset(assetPath: 'assets/images/square.png', top: 100, left: 50, size: 60),
          const FloatingAsset(assetPath: 'assets/images/code.png', top: 250, right: 80, size: 50),
          const FloatingAsset(assetPath: 'assets/images/cell.png', bottom: 200, left: 100, size: 55),
          const FloatingAsset(assetPath: 'assets/images/circle.png', bottom: 150, right: 120, size: 150, opacity: 0.1),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                // Available Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white10),
                    color: Colors.white.withAlpha(13), // 0.05 * 255
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.auto_awesome, size: 14, color: AppColors.purple),
                      SizedBox(width: 8),
                      Text('Available for Opportunities', style: TextStyle(color: AppColors.textBody, fontSize: 13)),
                    ],
                  ),
                ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),

                const SizedBox(height: 32),

                // Main Title
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFC084FC), Color(0xFF38BDF8)]).createShader(bounds),
                  child: const Text(
                    'Flutter Developer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white, height: 1.1, letterSpacing: -2),
                  ),
                ).animate().fadeIn(duration: 1000.ms, delay: 200.ms).scale(begin: const Offset(0.95, 0.95)),

                const SizedBox(height: 24),

                // Subtitle
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(text: 'Building '),
                      TextSpan(
                        text: 'Scalable',
                        style: TextStyle(color: Color(0xFFC084FC), fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' & '),
                      TextSpan(
                        text: 'High Performance',
                        style: TextStyle(color: Color(0xFF22D3EE), fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' Apps'),
                    ],
                  ),
                ).animate().fadeIn(duration: 800.ms, delay: 400.ms),

                const SizedBox(height: 20),

                // Description
                const SizedBox(
                  width: 600,
                  child: Text(
                    '2.6+ years of professional experience crafting production-grade\nmobile applications used by millions of users worldwide',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: AppColors.textBody, height: 1.6),
                  ),
                ).animate().fadeIn(duration: 800.ms, delay: 600.ms),

                const SizedBox(height: 40),

                // Tags
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: const [
                    _PillTag(label: 'Flutter'),
                    _PillTag(label: 'Firebase'),
                    _PillTag(label: 'Hive'),
                    _PillTag(label: 'REST APIs'),
                    _PillTag(label: 'GitHub Actions'),
                    _PillTag(label: 'GetX'),
                  ],
                ).animate().fadeIn(duration: 800.ms, delay: 700.ms),

                const SizedBox(height: 50),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF0EA5E9)]),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'View Projects',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.chevron_right, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        side: const BorderSide(color: Colors.white12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.white.withAlpha(13), // 0.05 * 255
                      ),
                      child: const Text(
                        'Contact Me',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ).animate().fadeIn(duration: 800.ms, delay: 800.ms).slideY(begin: 0.1, end: 0),

                const SizedBox(height: 60),

                // Scroll Indicator
                const Icon(Icons.mouse_outlined, color: Colors.white30, size: 28)
                    .animate(onPlay: (controller) => controller.repeat())
                    .moveY(begin: 0, end: 10, duration: 1.5.seconds, curve: Curves.easeInOut)
                    .then()
                    .moveY(begin: 10, end: 0, duration: 1.5.seconds, curve: Curves.easeInOut),
              ],
            ),
          ),

          // Floating Email/Message Icon
          Positioned(
            bottom: 40,
            right: 40,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF6366F1)]),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFA855F7).withAlpha(127), // 0.5 * 255
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(Icons.email_outlined, color: Colors.white, size: 28),
            ),
          ).animate().scale(delay: 1.seconds).fadeIn(),
        ],
      ),
    );
  }
}

class _PillTag extends StatelessWidget {
  final String label;
  const _PillTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B).withAlpha(25), // 0.1 * 255
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFF818CF8), fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class FloatingDots extends StatefulWidget {
  const FloatingDots({super.key});

  @override
  State<FloatingDots> createState() => _FloatingDotsState();
}

class _FloatingDotsState extends State<FloatingDots> {
  final List<Offset> _dots = List.generate(20, (index) => Offset(math.Random().nextDouble(), math.Random().nextDouble()));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _dots.map((dot) {
        return Positioned(
          left: dot.dx * MediaQuery.of(context).size.width,
          top: dot.dy * 850,
          child:
              Container(
                    width: 3,
                    height: 3,
                    decoration: const BoxDecoration(color: Color(0xFF0EA5E9), shape: BoxShape.circle),
                  )
                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                  .moveY(begin: -15, end: 15, duration: (2 + math.Random().nextInt(3)).seconds, curve: Curves.easeInOut)
                  .fadeIn(duration: 1.seconds),
        );
      }).toList(),
    );
  }
}

class FloatingAsset extends StatefulWidget {
  final String assetPath;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final double opacity;

  const FloatingAsset({super.key, required this.assetPath, this.top, this.bottom, this.left, this.right, required this.size, this.opacity = 0.4});

  @override
  State<FloatingAsset> createState() => _FloatingAssetState();
}

class _FloatingAssetState extends State<FloatingAsset> {
  double _rotationAngle = 0;
  Offset _hoverOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top != null ? widget.top! + _hoverOffset.dy : null,
      bottom: widget.bottom != null ? widget.bottom! - _hoverOffset.dy : null,
      left: widget.left != null ? widget.left! + _hoverOffset.dx : null,
      right: widget.right != null ? widget.right! - _hoverOffset.dx : null,
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _rotationAngle += 1; // Trigger spin
          _hoverOffset = Offset((math.Random().nextDouble() - 0.5) * 40, (math.Random().nextDouble() - 0.5) * 40);
        }),
        onExit: (_) => setState(() {
          _hoverOffset = Offset.zero;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          child: AnimatedRotation(
            turns: _rotationAngle,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutBack,
            child: Opacity(
              opacity: widget.opacity,
              child: Image.asset(widget.assetPath, width: widget.size, height: widget.size)
                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                  .moveY(begin: -20, end: 20, duration: 4.seconds, curve: Curves.easeInOut)
                  .rotate(duration: 20.seconds, begin: 0, end: 1)
                  .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 5.seconds),
            ),
          ),
        ),
      ),
    );
  }
}
