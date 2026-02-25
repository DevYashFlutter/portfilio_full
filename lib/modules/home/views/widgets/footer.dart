import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/controllers/home_controller.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/portfolio_data.dart';
import 'premium_hover_card.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: isMobile ? 24 : 40),
            child: Column(
              children: [
                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.code, color: AppColors.primaryDark, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      'Portfolio',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Copyright
                Text('© ${DateTime.now().year} ${PortfolioData.name}. All rights reserved.', style: TextStyle(color: AppColors.textBody.withAlpha(150), fontSize: 14)),
                const SizedBox(height: 8),
                // Credit
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Built with ', style: TextStyle(color: AppColors.textBody.withAlpha(150), fontSize: 14)),
                    const Icon(Icons.favorite, color: Colors.red, size: 14),
                    Text(' using Flutter', style: TextStyle(color: AppColors.textBody.withAlpha(150), fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 48),
                // Back to Top Button
                MouseRegion(
                  onEnter: (_) => setState(() => isHovered = true),
                  onExit: (_) => setState(() => isHovered = false),
                  child: PremiumHoverCard(
                    borderRadius: 30,
                    child: InkWell(
                      onTap: () => controller.scrollToSection(controller.heroKey),
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Theme.of(context).dividerColor.withAlpha(25)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Back to Top',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.arrow_upward_rounded,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
