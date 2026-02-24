import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

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
                // Section Title
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                  child: Text(
                    'About Me',
                    style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800)).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 16),
                Text(
                  'Problem Solver • Team Player • Lifelong Learner',
                  style: TextStyle(fontSize: isMobile ? 14 : 16, color: AppColors.textBody.withAlpha(150), letterSpacing: 1.2),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200)),
                const SizedBox(height: 60),

                // Content Grid
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  children: [
                    // About Cards
                    Expanded(
                      flex: isMobile ? 0 : 3,
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: const [
                          _AboutCard(icon: Icons.auto_awesome_rounded, title: 'Clean Code', desc: 'Maintaining high standards with reusable and testable code patterns.'),
                          _AboutCard(icon: Icons.bolt_rounded, title: 'Performance', desc: 'Optimizing for 60FPS and minimal resource consumption.'),
                          _AboutCard(icon: Icons.devices_rounded, title: 'Responsive', desc: 'Pixel-perfect layouts across all screen sizes and platforms.'),
                        ],
                      ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 400)),
                    ),
                    if (isMobile) const SizedBox(height: 48) else const SizedBox(width: 48),
                    // Summary Text
                    Expanded(
                      flex: isMobile ? 0 : 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Journey',
                            style: TextStyle(fontSize: isMobile ? 24 : 28, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'With over 5 years of experience in mobile development, I help startups and enterprises build their vision from the ground up. My focus is on creating seamless user experiences powered by robust backend integrations.',
                            style: TextStyle(fontSize: isMobile ? 14 : 16, color: AppColors.textBody, height: 1.7),
                          ),
                          const SizedBox(height: 32),
                          _buildStatRow('Commercial Apps', '15+'),
                          _buildStatRow('Code Quality', '98%'),
                          _buildStatRow('Client Sat.', '100%'),
                        ],
                      ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textBody, fontSize: 14)),
          Text(
            value,
            style: const TextStyle(color: Color(0xFF22D3EE), fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _AboutCard({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B).withAlpha(102),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFA855F7).withAlpha(25), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: const Color(0xFFA855F7), size: 24),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(desc, style: TextStyle(fontSize: 14, color: AppColors.textBody.withAlpha(150), height: 1.5)),
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
        width: MediaQuery.sizeOf(context).width < 850 ? double.infinity : 280,
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
      ).animate().fadeIn(duration: const Duration(milliseconds: 600), delay: widget.delay).scale(begin: const Offset(0.9, 0.9)),
    );
  }
}
