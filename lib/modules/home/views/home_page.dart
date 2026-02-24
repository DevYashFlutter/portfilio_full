import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'widgets/about_section.dart';
import 'widgets/nav_bar.dart';
import 'widgets/hero_section.dart';
import 'widgets/tech_stack_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/workflow_section.dart';
import 'widgets/animations_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/responsibilities_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: AppColors.background,
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.code, color: AppColors.purple, size: 48),
                    const SizedBox(height: 10),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF0EA5E9)]).createShader(bounds),
                      child: const Text(
                        'Flutter Dev',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _DrawerItem(label: 'About', onTap: () => controller.scrollToSection(controller.aboutKey)),
            _DrawerItem(label: 'Tech Stack', onTap: () => controller.scrollToSection(controller.techKey)),
            _DrawerItem(label: 'Projects', onTap: () => controller.scrollToSection(controller.projectKey)),
            _DrawerItem(label: 'Animations', onTap: () => controller.scrollToSection(controller.animationKey)),
            _DrawerItem(label: 'Workflow', onTap: () => controller.scrollToSection(controller.processKey)),
            _DrawerItem(label: 'Experience', onTap: () => controller.scrollToSection(controller.experienceKey)),
            _DrawerItem(label: 'Contact', onTap: () => controller.scrollToSection(controller.contactKey)),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                HeroSection(key: controller.heroKey),
                AboutSection(key: controller.aboutKey),
                TechStackSection(key: controller.techKey),
                ProjectsSection(key: controller.projectKey, title: "Industry Projects", type: "industry"),
                ProjectsSection(title: "Personal Projects", type: "personal"),
                AnimationsSection(key: controller.animationKey),
                WorkflowSection(key: controller.processKey),
                ExperienceSection(key: controller.experienceKey),
                ResponsibilitiesSection(),
                ContactSection(key: controller.contactKey),
                const Footer(),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF6366F1)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: const Color(0xFFA855F7).withAlpha(100), blurRadius: 20, spreadRadius: 2)],
        ),
        child: FloatingActionButton(
          onPressed: () => controller.scrollToSection(controller.contactKey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.mail_outline_rounded, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
