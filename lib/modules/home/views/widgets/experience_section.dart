import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
                    'Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800)).slideY(begin: 0.2, end: 0),

                const SizedBox(height: 16),

                Text(
                  '2.6+ years building impactful mobile applications',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 14 : 16, color: AppColors.textBody.withAlpha(200)),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200)),

                const SizedBox(height: 60),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isMobile)
                      Column(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: const Color(0xFF22D3EE),
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: const Color(0xFF22D3EE).withAlpha(150), blurRadius: 10, spreadRadius: 2)],
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 450,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [const Color(0xFF22D3EE), const Color(0xFFA855F7).withAlpha(50)],
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!isMobile) const SizedBox(width: 32),

                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(isMobile ? 24 : 32),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1B4B).withAlpha(102),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withAlpha(25)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isMobile)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Flutter Developer',
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Gaming & Fintech Startup',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFFA855F7).withAlpha(230)),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              )
                            else
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Flutter Developer',
                                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Gaming & Fintech Startup',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFFA855F7).withAlpha(230)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1E1B4B).withAlpha(153),
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: AppColors.blue.withAlpha(100)),
                                    ),
                                    child: const Text(
                                      'Full-time',
                                      style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 32),
                            Wrap(
                              spacing: 24,
                              runSpacing: 12,
                              children: [
                                _InfoLabel(icon: Icons.calendar_today_rounded, label: '2022 - Present'),
                                _InfoLabel(icon: Icons.location_on_rounded, label: 'Remote'),
                              ],
                            ),
                            const SizedBox(height: 48),
                            Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.center,
                              children: const [
                                _ExpStat(label: '11+', subLabel: 'Apps Built'),
                                _ExpStat(label: '5M+', subLabel: 'Total Users'),
                                _ExpStat(label: '100%', subLabel: 'Availability'),
                              ],
                            ),
                            const SizedBox(height: 48),
                            Text(
                              'Key Contributions',
                              style: TextStyle(fontSize: isMobile ? 18 : 20, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 24),
                            _AchievementItem(text: 'Developed 11+ production apps with 5M+ combined users'),
                            _AchievementItem(text: 'Integrated real-time features using WebSockets & Firebase'),
                            _AchievementItem(text: 'Optimized performance resulting in 40% faster load times'),
                            _AchievementItem(text: 'Established automated CI/CD pipelines using GitHub Actions'),
                          ],
                        ),
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

class _InfoLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: const Color(0xFF22D3EE)),
        const SizedBox(width: 8),
        Text(label, style: TextStyle(color: AppColors.textBody.withAlpha(150), fontSize: 14)),
      ],
    );
  }
}

class _ExpStat extends StatelessWidget {
  final String label;
  final String subLabel;

  const _ExpStat({required this.label, required this.subLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < 850 ? double.infinity : 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B).withAlpha(102),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(subLabel, style: TextStyle(fontSize: 12, color: AppColors.textBody.withAlpha(150))),
        ],
      ),
    );
  }
}

class _AchievementItem extends StatelessWidget {
  final String text;

  const _AchievementItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline_rounded, size: 18, color: Color(0xFF22D3EE)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 14, color: AppColors.textBody.withAlpha(200), height: 1.5)),
          ),
        ],
      ),
    );
  }
}
