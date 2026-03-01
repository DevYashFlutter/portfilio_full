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
import 'widgets/grid_background.dart';

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
                    const Icon(Icons.code, color: AppColors.primaryDark, size: 48),
                    const SizedBox(height: 10),
                    Text(
                      'Flutter Dev',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
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
            child: GridBackground(
              child: Column(
                children: [
                  HeroSection(key: controller.heroKey),
                  AboutSection(key: controller.aboutKey),
                  TechStackSection(key: controller.techKey),
                  ProjectsSection(key: controller.projectKey),
                  AnimationsSection(key: controller.animationKey),
                  WorkflowSection(key: controller.processKey),
                  ExperienceSection(key: controller.experienceKey),
                  ResponsibilitiesSection(),
                  ContactSection(key: controller.contactKey),
                  const Footer(),
                ],
              ),
            ),
          ),
          const NavBar(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.scrollToSection(controller.contactKey),
        backgroundColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        elevation: 0,
        child: Image.asset("assets/images/contact.png", width: 60, height: 60),
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
      title: Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
