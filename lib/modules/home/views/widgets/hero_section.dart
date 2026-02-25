import 'dart:ui';
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
      height: isMobile ? 800 : 900,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF020617), // slate-950
            Color(0xFF0F0720), // via-purple-950/20
            Color(0xFF020617), // slate-950
          ],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 1. Animated Background Orbs
          const Positioned.fill(child: _AnimatedBackgroundOrbs()),

          // 2. Floating Glassmorphism Cards
          if (!isMobile) ...[
            const _FloatingCard(left: 0.20, top: 0.30, delay: 0, duration: 3, dx: 20, dy: 30),
            const _FloatingCard(left: 0.40, top: 0.40, delay: 500, duration: 4, dx: -30, dy: 20),
            const _FloatingCard(left: 0.60, top: 0.50, delay: 1000, duration: 3.5, dx: 40, dy: -20),
            const _FloatingCard(left: 0.80, top: 0.60, delay: 1500, duration: 4.5, dx: -20, dy: 40),
          ],

          // 3. Main Content
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Badge
                    const _HeroBadge(),
                    const SizedBox(height: 24),

                    // Headline
                    _HeroHeadline(isMobile: isMobile),
                    const SizedBox(height: 24),

                    // Subtitle
                    const _HeroSubtitle(),
                    const SizedBox(height: 48),

                    // CTA Buttons
                    const _HeroCTAButtons(),
                    const SizedBox(height: 48),

                    // Tech Badges
                    const _HeroTechBadges(),
                    const SizedBox(height: 48),

                    // Social Links
                    const _HeroSocialLinks(),
                  ],
                ),
              ),
            ),
          ),

          // 4. Scroll Indicator
          const Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: _HeroScrollIndicator(),
          ),
        ],
      ),
    );
  }
}

class _AnimatedBackgroundOrbs extends StatelessWidget {
  const _AnimatedBackgroundOrbs();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple Orb
        Positioned(
          top: 0.25 * 900,
          left: 0.15 * MediaQuery.of(context).size.width,
          child: _Orb(
            color: const Color(0xFFA855F7).withOpacity(0.15),
            size: 350,
            duration: 8,
          ),
        ),
        // Cyan Orb
        Positioned(
          bottom: 0.25 * 900,
          right: 0.15 * MediaQuery.of(context).size.width,
          child: _Orb(
            color: const Color(0xFF06B6D4).withOpacity(0.15),
            size: 350,
            duration: 8,
            reverse: true,
          ),
        ),
        // Blue Orb
        Positioned(
          top: 0.45 * 900,
          right: 0.33 * MediaQuery.of(context).size.width,
          child: _Orb(
            color: const Color(0xFF3B82F6).withOpacity(0.15),
            size: 280,
            duration: 6,
          ),
        ),
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  final Color color;
  final double size;
  final double duration;
  final bool reverse;

  const _Orb({
    required this.color,
    required this.size,
    required this.duration,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    )
    .animate(onPlay: (c) => c.repeat())
    .scale(
      begin: const Offset(1, 1),
      end: Offset(reverse ? 1.3 : 1.2, reverse ? 1.3 : 1.2),
      duration: Duration(milliseconds: (duration * 1000).toInt()),
      curve: Curves.easeInOut,
    )
    .custom(
      builder: (context, value, child) => Opacity(
        opacity: reverse ? (0.5 - (value * 0.2)) : (0.3 + (value * 0.2)),
        child: child,
      ),
    )
    .blurXY(begin: 80, end: 100);
  }
}

class _FloatingCard extends StatelessWidget {
  final double left;
  final double top;
  final int delay;
  final double duration;
  final double dx;
  final double dy;

  const _FloatingCard({
    required this.left,
    required this.top,
    required this.delay,
    required this.duration,
    required this.dx,
    required this.dy,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      left: left * screenWidth,
      top: top * 800,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFA855F7).withOpacity(0.1),
                  const Color(0xFF06B6D4).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFFA855F7).withOpacity(0.2),
              ),
            ),
          ),
        ),
      )
      .animate(onPlay: (c) => c.repeat(), delay: Duration(milliseconds: delay))
      .move(
        begin: Offset.zero,
        end: Offset(dx, dy),
        duration: Duration(milliseconds: (duration * 1000).toInt()),
        curve: Curves.easeInOut,
      )
      .rotate(
        begin: 0,
        end: 1,
        duration: Duration(milliseconds: (duration * 1000).toInt()),
        curve: Curves.easeInOut,
      )
      .then()
      .move(
        begin: Offset(dx, dy),
        end: Offset.zero,
        duration: Duration(milliseconds: (duration * 1000).toInt()),
        curve: Curves.easeInOut,
      ),
    );
  }
}

class _HeroBadge extends StatelessWidget {
  const _HeroBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFA855F7).withOpacity(0.2),
            const Color(0xFF06B6D4).withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFA855F7).withOpacity(0.3),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '👋 Available for opportunities',
                style: TextStyle(
                  color: Color(0xFFD8B4FE), // purple-300
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 600)).moveY(begin: -20, end: 0, duration: const Duration(milliseconds: 600));
  }
}

class _HeroHeadline extends StatelessWidget {
  final bool isMobile;
  const _HeroHeadline({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final double fontSize = isMobile ? 36 : 64;

    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFFE9D5FF), Color(0xFFCFFAFE)],
          ).createShader(bounds),
          child: Text(
            'Flutter Developer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              height: 1.1,
              color: Colors.white,
            ),
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFC084FC), Color(0xFF22D3EE), Color(0xFF60A5FA)],
          ).createShader(bounds),
          child: Text(
            'Building Scalable &',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              height: 1.1,
              color: Colors.white,
            ),
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF22D3EE), Color(0xFF60A5FA), Color(0xFFC084FC)],
          ).createShader(bounds),
          child: Text(
            'High Performance Apps',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              height: 1.1,
              color: Colors.white,
            ),
          ),
        ),
      ],
    )
    .animate()
    .fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200))
    .moveY(begin: 20, end: 0, duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200));
  }
}

class _HeroSubtitle extends StatelessWidget {
  const _HeroSubtitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      '1.3+ years crafting production-ready mobile applications for millions of users. Specialized in cross-platform development with Flutter, building scalable architectures and optimizing performance.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: const Color(0xFFCBD5E1), // slate-300
        height: 1.6,
      ),
    )
    .animate()
    .fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 400))
    .moveY(begin: 20, end: 0, duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 400));
  }
}

class _HeroCTAButtons extends StatelessWidget {
  const _HeroCTAButtons();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // View Projects
        Container(
          height: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF9333EA), Color(0xFF0891B2)], // purple-600, cyan-600
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFA855F7).withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => controller.scrollToSection(controller.projectKey),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Row(
              children: [
                Text(
                  'View Projects',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, size: 20, color: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Contact Me
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFA855F7).withOpacity(0.3),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: ElevatedButton(
                onPressed: () => controller.scrollToSection(controller.contactKey),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.mail_outline_rounded, size: 20, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Contact Me',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    )
    .animate()
    .fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 600))
    .moveY(begin: 20, end: 0, duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 600));
  }
}

class _HeroTechBadges extends StatelessWidget {
  const _HeroTechBadges();

  @override
  Widget build(BuildContext context) {
    final tech = ['Flutter', 'Firebase', 'Hive', 'REST APIs', 'GitHub Actions', 'GetX'];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: List.generate(
        tech.length,
        (index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFA855F7).withOpacity(0.1),
                const Color(0xFF06B6D4).withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFA855F7).withOpacity(0.2),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Text(
                tech[index],
                style: const TextStyle(
                  color: Color(0xFFE9D5FF), // purple-200
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 500), delay: Duration(milliseconds: 800 + index * 100))
        .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
      ),
    );
  }
}

class _HeroSocialLinks extends StatelessWidget {
  const _HeroSocialLinks();

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.code_rounded, 'label': 'GitHub'},
      {'icon': Icons.business_center_rounded, 'label': 'LinkedIn'},
      {'icon': Icons.file_download_rounded, 'label': 'Resume'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        items.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: _SocialIcon(icon: items[index]['icon'] as IconData, label: items[index]['label'] as String),
        ),
      ),
    )
    .animate()
    .fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 1200));
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String label;

  const _SocialIcon({required this.icon, required this.label});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isHovered ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.05),
          shape: BoxShape.circle,
          border: Border.all(
            color: isHovered
                ? const Color(0xFFA855F7).withOpacity(0.4)
                : const Color(0xFFA855F7).withOpacity(0.2),
          ),
        ),
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Icon(
              widget.icon,
              size: 20,
              color: isHovered ? const Color(0xFFE9D5FF) : const Color(0xFFD8B4FE),
            ),
          ),
        ),
      ).animate(target: isHovered ? 1 : 0).scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: const Duration(milliseconds: 200)),
    );
  }
}

class _HeroScrollIndicator extends StatelessWidget {
  const _HeroScrollIndicator();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFFA855F7).withOpacity(0.3),
              width: 2,
            ),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFC084FC),
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (c) => c.repeat())
              .moveY(begin: 0, end: 20, duration: const Duration(seconds: 2), curve: Curves.easeInOut),
            ],
          ),
        ),
      ],
    )
    .animate(onPlay: (c) => c.repeat())
    .moveY(begin: 0, end: 10, duration: const Duration(seconds: 2), curve: Curves.easeInOut)
    .then()
    .moveY(begin: 10, end: 0, duration: const Duration(seconds: 2), curve: Curves.easeInOut);
  }
}


