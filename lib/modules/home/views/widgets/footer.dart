import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: AppColors.purple.withAlpha(76))), // 0.3 * 255
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(gradient: AppColors.primaryGradient, borderRadius: BorderRadius.circular(4)),
                        child: const Icon(Icons.code, size: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      ShaderMask(
                        shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                        child: const Text(
                          'Flutter Dev',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Crafting exceptional digital experiences\nwith Flutter & Material Design.', style: TextStyle(color: AppColors.textBody, fontSize: 14)),
                ],
              ),
              Row(
                children: [
                  _SocialIcon(icon: Icons.link_rounded),
                  _SocialIcon(icon: Icons.alternate_email_rounded),
                  _SocialIcon(icon: Icons.code_rounded),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('© 2024 Flutter Developer Portfolio. All rights reserved.', style: TextStyle(color: AppColors.textBody, fontSize: 12)),
              Text('Built with ❤️ using Flutter', style: TextStyle(color: AppColors.textBody, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(13), // 0.05 * 255
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.purple.withAlpha(51)), // 0.2 * 255
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
