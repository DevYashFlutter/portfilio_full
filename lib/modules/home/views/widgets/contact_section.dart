import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 950;

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
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                  child: Text(
                    "Let's Connect",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800)),
                const SizedBox(height: 16),
                Text(
                  "Open to exciting opportunities. Let's build something amazing together!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 14 : 16, color: AppColors.textBody.withAlpha(180)),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200)),
                const SizedBox(height: 60),
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Contact Form
                    Expanded(
                      flex: isMobile ? 0 : 3,
                      child: Container(
                        padding: EdgeInsets.all(isMobile ? 24 : 32),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1B4B).withAlpha(102),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withAlpha(25)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Send a Message',
                              style: TextStyle(fontSize: isMobile ? 20 : 28, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 32),
                            const _ContactField(label: 'Your Name', hint: 'John Doe'),
                            const SizedBox(height: 24),
                            const _ContactField(label: 'Email Address', hint: 'john@example.com'),
                            const SizedBox(height: 24),
                            const _ContactField(label: 'Message', hint: 'How can I help you?', maxLines: 4),
                            const SizedBox(height: 32),
                            Container(
                              width: double.infinity,
                              height: 54,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF0EA5E9)]),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  elevation: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.send_rounded, size: 18),
                                    SizedBox(width: 10),
                                    Text('Send Message', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isMobile) const SizedBox(height: 32) else const SizedBox(width: 32),
                    // Contact Inf / Socials
                    Expanded(
                      flex: isMobile ? 0 : 2,
                      child: Column(
                        children: [
                          // Follow Me Grid
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E1B4B).withAlpha(102),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.white.withAlpha(25)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Follow Me',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                const SizedBox(height: 24),
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: width < 500 ? 1 : 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: width < 500 ? 3 : 1.2,
                                  children: const [
                                    _SocialCard(icon: Icons.code_rounded, label: 'GitHub'),
                                    _SocialCard(icon: Icons.link_rounded, label: 'LinkedIn'),
                                    _SocialCard(icon: Icons.alternate_email_rounded, label: 'Twitter'),
                                    _SocialCard(icon: Icons.email_outlined, label: 'Email'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // GitHub Activity
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E1B4B).withAlpha(102),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.white.withAlpha(25)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.code_rounded, color: Colors.white, size: 20),
                                    SizedBox(width: 12),
                                    Text(
                                      'GitHub Activity',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    _ActivityStat(label: 'Repositories', value: '150+'),
                                    _ActivityStat(label: 'Contributions', value: '500+'),
                                    _ActivityStat(label: 'Stars', value: '50+'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 400)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SocialCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}

class _ActivityStat extends StatelessWidget {
  final String label;
  final String value;

  const _ActivityStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: AppColors.textBody.withAlpha(150), fontSize: 12)),
      ],
    );
  }
}

class _ContactField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;

  const _ContactField({required this.label, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: AppColors.textBody.withAlpha(200), fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textBody.withAlpha(100)),
            filled: true,
            fillColor: Colors.black.withAlpha(50),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withAlpha(25)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF22D3EE)),
            ),
          ),
        ),
      ],
    );
  }
}
