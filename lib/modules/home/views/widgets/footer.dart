import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/home/controllers/home_controller.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      color: Colors.black,
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
                    const Icon(Icons.code, color: AppColors.purple, size: 24),
                    const SizedBox(width: 8),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF0EA5E9)]).createShader(bounds),
                      child: const Text(
                        'Portfolio',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Copyright
                Text('© 2026 All rights reserved.', style: TextStyle(color: AppColors.textBody.withAlpha(150), fontSize: 14)),
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
                InkWell(
                  onTap: () => controller.scrollToSection(controller.heroKey),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1B4B),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white.withAlpha(25)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Back to Top',
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_upward_rounded, color: Colors.white, size: 16),
                      ],
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

