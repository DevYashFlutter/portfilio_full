import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/modules/home/controllers/home_controller.dart';
import 'dart:math' as math;

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      height: isMobile ? 700 : 850,
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Stack(
            children: [
              // Decorative background elements
              const FloatingDots(),
              ..._buildFloatingAssets(isMobile),

              // Main Content
              Padding(
                padding: EdgeInsets.symmetric(vertical: isMobile ? 80 : 120, horizontal: isMobile ? 24 : 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1B4B).withAlpha(102),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white.withAlpha(25)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(color: Color(0xFF22D3EE), shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Open for new opportunities',
                            style: TextStyle(color: const Color(0xFF22D3EE), fontSize: isMobile ? 12 : 13, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: const Duration(milliseconds: 600)).slideX(begin: -0.2, end: 0),
                    const SizedBox(height: 24),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                      child: Text(
                        'Building Next-Gen\nMobile Experiences',
                        style: TextStyle(fontSize: isMobile ? 36 : 64, fontWeight: FontWeight.bold, height: 1.1, color: Colors.white),
                      ),
                    ).animate().fadeIn(duration: const Duration(milliseconds: 1000), delay: const Duration(milliseconds: 200)).scale(begin: const Offset(0.95, 0.95)),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 600,
                      child: Text(
                        'Senior Flutter Developer specializing in high-performance, beautiful, and scalable mobile applications with clean architecture.',
                        style: TextStyle(fontSize: isMobile ? 16 : 18, color: AppColors.textBody.withAlpha(200), height: 1.6),
                      ),
                    ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 400)),
                    const SizedBox(height: 48),
                    Row(
                      children: [
                        _buildCTAButton('View Projects', () => Get.find<HomeController>().scrollToSection(Get.find<HomeController>().projectKey), isPrimary: true),
                        const SizedBox(width: 16),
                        _buildCTAButton('Contact Me', () => Get.find<HomeController>().scrollToSection(Get.find<HomeController>().contactKey), isPrimary: false),
                      ],
                    ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 600)),

                    const SizedBox(height: 60),

                    // Scroll Indicator
                    const Icon(Icons.mouse_outlined, color: Colors.white30, size: 28)
                        .animate(onPlay: (controller) => controller.repeat())
                        .moveY(begin: 0, end: 10, duration: const Duration(milliseconds: 1500), curve: Curves.easeInOut)
                        .then()
                        .moveY(begin: 10, end: 0, duration: const Duration(milliseconds: 1500), curve: Curves.easeInOut),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCTAButton(String label, VoidCallback onTap, {required bool isPrimary}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        gradient: isPrimary ? const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]) : null,
        borderRadius: BorderRadius.circular(12),
        border: isPrimary ? null : Border.all(color: Colors.white.withAlpha(25)),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? Colors.transparent : const Color(0xFF1E1B4B).withAlpha(102),
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    );
  }

  List<Widget> _buildFloatingAssets(bool isMobile) {
    if (isMobile) return [];
    return [
      Positioned(
        top: 100,
        right: 150,
        child: _FloatingAsset(icon: Icons.flutter_dash_rounded, color: const Color(0xFF0284C7)),
      ),
      Positioned(
        top: 300,
        right: 50,
        child: _FloatingAsset(icon: Icons.rocket_launch_rounded, color: const Color(0xFFA855F7)),
      ),
      Positioned(
        top: 250,
        right: 250,
        child: _FloatingAsset(icon: Icons.data_object_rounded, color: const Color(0xFF22D3EE)),
      ),
    ];
  }
}

class _FloatingAsset extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _FloatingAsset({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
            color: color.withAlpha(25),
            shape: BoxShape.circle,
            border: Border.all(color: color.withAlpha(51)),
      ),
          child: Icon(icon, color: color, size: 28),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .moveY(
          begin: -15,
          end: 15,
          duration: Duration(seconds: 2 + math.Random().nextInt(3)),
          curve: Curves.easeInOut,
        )
        .fadeIn(duration: const Duration(seconds: 1));
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
                  .moveY(
                    begin: -15,
                    end: 15,
                    duration: Duration(seconds: 2 + math.Random().nextInt(3)),
                    curve: Curves.easeInOut,
                  )
                  .fadeIn(duration: const Duration(seconds: 1)),
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
                  .moveY(begin: -20, end: 20, duration: const Duration(seconds: 4), curve: Curves.easeInOut)
                  .rotate(duration: const Duration(seconds: 20), begin: 0, end: 1)
                  .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: const Duration(seconds: 5)),
            ),
          ),
        ),
      ),
    );
  }
}
