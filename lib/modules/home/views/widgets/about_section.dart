import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 80),
      color: AppColors.background,
      child: Column(
        children: [
          // Section Title
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
            child: const Text(
              'About Me',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),

          const SizedBox(height: 16),

          // Subtitle
          const SizedBox(
            width: 700,
            child: Text(
              'Passionate Flutter developer with 2.6+ years of experience building high-impact mobile applications for startups and enterprises',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: AppColors.textBody, height: 1.5),
            ),
          ).animate().fadeIn(duration: 800.ms, delay: 200.ms),

          const SizedBox(height: 80),

          // Feature Cards Grid
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _FeatureCard(
                title: 'Large-Scale Production Apps',
                description: 'Built apps serving millions of users across multiple platforms',
                imagePath: 'assets/images/people.png',
                delay: 400.ms,
              ),
              _FeatureCard(
                title: 'Cross-Platform Development',
                description: 'Expert in Flutter for iOS, Android, and Web applications',
                imagePath: 'assets/images/rocker.png',
                delay: 600.ms,
              ),
              _FeatureCard(
                title: 'Performance Optimization',
                description: 'Specialized in creating smooth, responsive user experiences',
                imagePath: 'assets/images/flash.png',
                delay: 800.ms,
              ),
              _FeatureCard(
                title: 'Scalable Architecture',
                description: 'Design patterns and clean architecture for maintainable code',
                imagePath: 'assets/images/badge.png',
                delay: 1000.ms,
              ),
            ],
          ),

          const SizedBox(height: 80),

          // Professional Summary
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1B4B).withAlpha(76), // 0.3 * 255
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withAlpha(25)), // 0.1 * 255
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1E1B4B).withAlpha(127), // 0.5 * 255
                  const Color(0xFF0F172A).withAlpha(127),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Professional Summary',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Experienced Flutter Developer with a proven track record of delivering high-quality, scalable mobile applications. Specialized in building production-grade apps for gaming, education, and fintech sectors.\n\nCurrently working on large-scale applications serving millions of users, with expertise in Firebase integration, state management, performance optimization, and implementing CI/CD pipelines for seamless deployment.',
                  style: TextStyle(fontSize: 18, color: AppColors.textBody, height: 1.8),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 800.ms, delay: 1200.ms).slideY(begin: 0.1, end: 0),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final Duration delay;

  const _FeatureCard({required this.title, required this.description, required this.imagePath, required this.delay});

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: isHovered ? Matrix4.diagonal3Values(1.05, 1.05, 1.0) : Matrix4.identity(),
        width: 280,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF1E1B4B).withAlpha(153) : const Color(0xFF1E1B4B).withAlpha(102),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isHovered ? Colors.transparent : Colors.white.withAlpha(25)),
          gradient: isHovered ? const LinearGradient(colors: [Color(0xFFC084FC), Color(0xFF38BDF8)], begin: Alignment.topLeft, end: Alignment.bottomRight) : null,
          boxShadow: isHovered ? [BoxShadow(color: const Color(0xFFC084FC).withAlpha(100), blurRadius: 20, offset: const Offset(0, 10))] : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: isHovered ? Colors.white.withAlpha(50) : Colors.white.withAlpha(13), borderRadius: BorderRadius.circular(12)),
              child: Image.asset(widget.imagePath, width: 32, height: 32, color: isHovered ? Colors.white : const Color(0xFFA855F7)),
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isHovered ? Colors.white : Colors.white, height: 1.2),
            ),
            const SizedBox(height: 12),
            Text(widget.description, style: TextStyle(fontSize: 14, color: isHovered ? Colors.white.withAlpha(200) : AppColors.textBody, height: 1.5)),
          ],
        ),
      ).animate().fadeIn(duration: 600.ms, delay: widget.delay).scale(begin: const Offset(0.9, 0.9)),
    );
  }
}
