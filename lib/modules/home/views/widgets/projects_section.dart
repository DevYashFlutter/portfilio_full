import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'premium_hover_card.dart';
import 'package:portfolio/utils/portfolio_data.dart';
import 'package:get/get.dart';

class ProjectsSection extends StatefulWidget {
  final String title;
  final String type;

  const ProjectsSection({super.key, required this.title, required this.type});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String selectedType = 'All';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    final industrialProjects = PortfolioData.industryProjects;
    final personalProjects = PortfolioData.personalProjects;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A),
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Section Header
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 36 : 56, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Handpicked works and industrial contributions',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white54),
              ),
              const SizedBox(height: 50),

              // Filter Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FilterTab(label: 'All', isSelected: selectedType == 'All', onTap: () => setState(() => selectedType = 'All')),
                  const SizedBox(width: 12),
                  _FilterTab(label: 'Industrial', isSelected: selectedType == 'Industrial', onTap: () => setState(() => selectedType = 'Industrial')),
                  const SizedBox(width: 12),
                  _FilterTab(label: 'Personal', isSelected: selectedType == 'Personal', onTap: () => setState(() => selectedType = 'Personal')),
                ],
              ),
              const SizedBox(height: 60),

              // Projects Grid
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : (width < 1200 ? 2 : 3),
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: 0.82,
                ),
                itemCount: _getFilteredProjects(industrialProjects, personalProjects).length,
                itemBuilder: (context, index) {
                  final project = _getFilteredProjects(industrialProjects, personalProjects)[index];
                  return _ProjectCard(
                    title: project['title'],
                    description: project['desc'],
                    tags: List<String>.from(project['tags']),
                    users: project['users'] ?? '0',
                    rating: project['rating'] ?? '5.0',
                    perf: project['perf'] ?? 'N/A',
                    color: project['color'] ?? const Color(0xFFA855F7), // Provide default color if missing
                    category: project['category'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<dynamic> _getFilteredProjects(List<dynamic> industrial, List<dynamic> personal) {
    if (selectedType == 'Industrial') return industrial;
    if (selectedType == 'Personal') return personal;
    return industrial + personal;
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterTab({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(26),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFA855F7).withAlpha(30) : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          border: isSelected ? Border.all(color: const Color(0xFFA855F7).withAlpha(100)) : Border.all(color: Colors.transparent),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white.withAlpha(100),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tags;
  final String users;
  final String rating;
  final String perf;
  final Color color;
  final String category;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tags,
    required this.users,
    required this.rating,
    required this.perf,
    required this.color,
    required this.category,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: PremiumHoverCard(
        borderRadius: 24,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withAlpha(150),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isHovered ? widget.color.withAlpha(100) : Colors.white.withAlpha(20),
              width: isHovered ? 2 : 1,
            ),
            boxShadow: isHovered ? [BoxShadow(color: widget.color.withAlpha(30), blurRadius: 20, spreadRadius: 5)] : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image/Icon area
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A).withAlpha(150),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white.withAlpha(5), Colors.white.withAlpha(2)],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 60,
                        height: 90,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [widget.color, widget.color.withAlpha(150)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: widget.color.withAlpha(100), blurRadius: 15)],
                        ),
                        child: const Icon(
                          Icons.phone_android_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5CF6).withAlpha(100),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.category,
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 6),
              Text(
                widget.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: Colors.white.withAlpha(150), height: 1.5),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.tags.map((tag) => _Tag(label: tag)).toList(),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Stat(icon: Icons.person_outline_rounded, label: 'Users', value: widget.users, color: const Color(0xFFA855F7)),
                  _Stat(icon: Icons.star_outline_rounded, label: 'Rating', value: widget.rating, color: const Color(0xFF0EA5E9)),
                  _Stat(icon: Icons.speed_rounded, label: 'Perf', value: widget.perf, color: const Color(0xFF10B981)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('View Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(width: 8),
                      Icon(Icons.open_in_new_rounded, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFA855F7).withAlpha(50)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFFA855F7), fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _Stat({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withAlpha(100),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withAlpha(10)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 10, color: Colors.white.withAlpha(100))),
            const SizedBox(height: 2),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
