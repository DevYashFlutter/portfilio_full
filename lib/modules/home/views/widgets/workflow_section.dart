import 'package:portfolio/utils/portfolio_data.dart';
import 'premium_hover_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WorkflowSection extends StatelessWidget {
  const WorkflowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A),
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Header
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                child: Text(
                  'Development Workflow',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 36 : 56, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'A streamlined process from concept to production',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 14 : 18, color: Colors.white.withAlpha(150)),
              ),
              const SizedBox(height: 80),

              // Steps Row
              isMobile
                  ? Column(
                      children: _buildSteps(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _buildSteps(),
                    ),

              const SizedBox(height: 100),

              // Metrics Row
              GridView.count(
                crossAxisCount: isMobile ? 1 : 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 2.5 : 1.3,
                children: const [
                  _MetricCard(value: '50%', label: 'Faster Deployment', color: Color(0xFF818CF8)),
                  _MetricCard(value: '99%', label: 'Code Coverage', color: Color(0xFF22D3EE)),
                  _MetricCard(value: '24/7', label: 'CI/CD Pipeline', color: Color(0xFF34D399)),
                  _MetricCard(value: '100%', label: 'Code Quality', color: Color(0xFFF472B6)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSteps() {
    return [
      _StepCircle(icon: Icons.lightbulb_outline_rounded, label: 'Design', sub: 'UI/UX Design & Prototyping', color: const Color(0xFFF59E0B)),
      _StepCircle(icon: Icons.code_rounded, label: 'Development', sub: 'Clean Code Implementation', color: const Color(0xFF6366F1)),
      _StepCircle(icon: Icons.bug_report_outlined, label: 'Testing', sub: 'Quality Assurance', color: const Color(0xFF10B981)),
      _StepCircle(icon: Icons.rocket_launch_rounded, label: 'Deployment', sub: 'App Store Release', color: const Color(0xFFF43F5E)),
      _StepCircle(icon: Icons.sync_rounded, label: 'CI/CD', sub: 'Continuous Integration', color: const Color(0xFF0EA5E9)),
      _StepCircle(icon: Icons.verified_user_outlined, label: 'Maintenance', sub: 'Ongoing Support', color: const Color(0xFFA855F7)),
    ];
  }
}

class _StepCircle extends StatefulWidget {
  final IconData icon;
  final String label;
  final String sub;
  final Color color;

  const _StepCircle({required this.icon, required this.label, required this.sub, required this.color});

  @override
  State<_StepCircle> createState() => _StepCircleState();
}

class _StepCircleState extends State<_StepCircle> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.sizeOf(context).width < 850;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 0),
      child: PremiumHoverCard(
        borderRadius: 50,
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: widget.color.withAlpha(80), blurRadius: 15, spreadRadius: 2)],
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(height: 16),
              Text(widget.label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 4),
              SizedBox(
                width: 140,
                child: Text(
                  widget.sub,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withAlpha(100), fontSize: 10, height: 1.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _MetricCard({required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return PremiumHoverCard(
      borderRadius: 20,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withAlpha(180),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withAlpha(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 13, color: Colors.white.withAlpha(120), fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
