import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/portfolio_data.dart';
import 'premium_hover_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;
    final exp = PortfolioData.experience[0];

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
                    'Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800)).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 16),
                Text(
                  '2.3+ years building impactful mobile applications',
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
                            height: 550,
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
                                  Text(
                                    exp['role'] as String,
                                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    exp['company'] as String,
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
                                      Text(
                                        exp['role'] as String,
                                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        exp['company'] as String,
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
                                _InfoLabel(icon: Icons.calendar_today_rounded, label: exp['period'] as String),
                                _InfoLabel(icon: Icons.location_on_rounded, label: exp['location'] as String),
                              ],
                            ),
                            const SizedBox(height: 48),
                            Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.center,
                              children: (exp['stats'] as List<Map<String, String>>).map((s) => _ExpStat(label: s['label']!, subLabel: s['subLabel']!)).toList(),
                            ),
                            const SizedBox(height: 48),
                            Text(
                              'Key Contributions',
                              style: TextStyle(fontSize: isMobile ? 18 : 20, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 24),
                            ...(exp['contributions'] as List<String>).map((c) => _AchievementItem(text: c)).toList(),
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
    return PremiumHoverCard(
      borderRadius: 16,
      child: Container(
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
      ),
    );
  }
}

class _AchievementItem extends StatefulWidget {
  final String text;

  const _AchievementItem({required this.text});

  @override
  State<_AchievementItem> createState() => _AchievementItemState();
}

class _AchievementItemState extends State<_AchievementItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: 18,
              color: const Color(0xFF22D3EE),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(widget.text, style: TextStyle(fontSize: 14, color: AppColors.textBody.withAlpha(200), height: 1.5)),
            ),
          ],
        ),
      ),
    );
  }
}
