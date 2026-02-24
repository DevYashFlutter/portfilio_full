import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/modules/home/controllers/home_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: controller.isScrolled.value ? Colors.black.withAlpha(153) : Colors.transparent, // 0.6 * 255
          border: Border(
            bottom: BorderSide(
              color: controller.isScrolled.value ? Colors.white.withAlpha(25) : Colors.transparent, // 0.1 * 255
            ),
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: controller.isScrolled.value ? 10 : 0, sigmaY: controller.isScrolled.value ? 10 : 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                children: [
                  // Logo
                  Row(
                    children: [
                      const Icon(Icons.code, color: AppColors.purple, size: 28),
                      const SizedBox(width: 10),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF0EA5E9)]).createShader(bounds),
                        child: const Text(
                          'Flutter Dev',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Navigation Links
                  Row(
                    children: const [
                      _NavButton(label: 'Home', isActive: true),
                      _NavButton(label: 'About'),
                      _NavButton(label: 'Tech Stack'),
                      _NavButton(label: 'Projects'),
                      _NavButton(label: 'Animations'),
                      _NavButton(label: 'Process'),
                      _NavButton(label: 'Experience'),
                      _NavButton(label: 'Contact'),
                    ],
                  ),
                  const Spacer(),
                  // Hire Me Button
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF0EA5E9)]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Hire Me',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const _NavButton({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {},
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? Colors.white : AppColors.textBody.withAlpha(204), // 0.8 * 255
          ),
        ),
      ),
    );
  }
}
