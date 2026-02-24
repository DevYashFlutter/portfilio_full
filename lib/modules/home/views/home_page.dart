import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'widgets/about_section.dart';
import 'widgets/nav_bar.dart';
import 'widgets/hero_section.dart';
import 'widgets/tech_stack_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: const [
                HeroSection(),
                AboutSection(),
                TechStackSection(),
                ProjectsSection(title: "Industry Projects", type: "industry"),
                ProjectsSection(title: "Personal Projects", type: "personal"),
                Footer(),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
