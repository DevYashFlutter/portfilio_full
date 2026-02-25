import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      // Logo
                      InkWell(
                        onTap: () => controller.scrollToSection(controller.heroKey),
                        child: Row(
                          children: [
                            const Icon(Icons.code, color: AppColors.primaryDark, size: 28),
                            const SizedBox(width: 10),
                            Text(
                              'Flutter Dev',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      // Navigation Links (Visible only on Desktop)
                      if (MediaQuery.sizeOf(context).width > 1000)
                        Row(
                          children: [
                            _NavButton(label: 'About', onTap: () => controller.scrollToSection(controller.aboutKey)),
                            _NavButton(label: 'Tech Stack', onTap: () => controller.scrollToSection(controller.techKey)),
                            _NavButton(label: 'Projects', onTap: () => controller.scrollToSection(controller.projectKey)),
                            _NavButton(label: 'Animations', onTap: () => controller.scrollToSection(controller.animationKey)),
                            _NavButton(label: 'Workflow', onTap: () => controller.scrollToSection(controller.processKey)),
                            _NavButton(label: 'Experience', onTap: () => controller.scrollToSection(controller.experienceKey)),
                            _NavButton(label: 'Contact', onTap: () => controller.scrollToSection(controller.contactKey)),
                          ],
                        ),
                      if (MediaQuery.sizeOf(context).width > 1000) const Spacer(),
                      // Hire Me Button
                      if (MediaQuery.sizeOf(context).width > 600)
                        Container(
                          height: 44,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF0EA5E9)]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () => controller.scrollToSection(controller.contactKey),
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
                      if (MediaQuery.sizeOf(context).width <= 1000)
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.label, required this.onTap});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: GoogleFonts.inter(
              color: isHovered ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              fontSize: 14,
              fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
