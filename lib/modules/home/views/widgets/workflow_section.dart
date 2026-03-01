import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/responsive.dart';

class WorkflowSection extends StatelessWidget {
  const WorkflowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background with Gradients and Grid
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF020617), // slate-950
                  Color(0xFF0F172A), // slate-900
                  Color(0xFF020617), // slate-950
                ],
              ),
            ),
          ),
        ),

        // Animated background grid
        Positioned.fill(
          child: Opacity(opacity: 0.1, child: CustomPaint(painter: _WorkflowGridPainter())),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 96),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 64),
              Responsive(mobile: _buildMobileWorkflow(context), desktop: _buildDesktopWorkflow(context)),
              const SizedBox(height: 150),
              _buildMetrics(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFA855F7), Color(0xFF22D3EE)], // purple-400 to cyan-400
            ).createShader(bounds),
            child: Text(
              'Development Workflow',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: isMobile ? 36 : 48, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3, end: 0),
          const SizedBox(height: 16),
          Text(
            'A streamlined process from concept to production',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xFF94A3B8), // slate-400
            ),
          ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideY(begin: 0.3, end: 0),
        ],
      ),
    );
  }

  Widget _buildDesktopWorkflow(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Connection lines
          Positioned.fill(
            child: CustomPaint(painter: _ConnectionLinePainter(stepCount: workflowSteps.length)).animate().custom(
              duration: 1.seconds,
              delay: 500.ms,
              builder: (context, value, child) => Opacity(opacity: value, child: child),
            ),
          ),

          // Steps
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: workflowSteps.asMap().entries.map((entry) {
              return Expanded(
                child: _WorkflowStepItem(step: entry.value, index: entry.key)
                    .animate()
                    .fadeIn(duration: 600.ms, delay: (entry.key * 150).ms)
                    .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1))
                    .slideY(begin: 0.3, end: 0),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileWorkflow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: workflowSteps.asMap().entries.map((entry) {
          final bool isLast = entry.key == workflowSteps.length - 1;
          return Column(
            children: [
              _MobileWorkflowCard(step: entry.value).animate().fadeIn(duration: 600.ms, delay: (entry.key * 100).ms).slideX(begin: -0.1, end: 0),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Text(
                    '↓',
                    style: TextStyle(color: Color(0xFFA855F7), fontSize: 24),
                  ).animate().fadeIn(duration: 500.ms, delay: (500 + entry.key * 100).ms).slideY(begin: -0.4, end: 0),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMetrics(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final List<Map<String, String>> metrics = [
      {'value': '50%', 'label': 'Faster Deployment'},
      {'value': '99%', 'label': 'Code Coverage'},
      {'value': '24/7', 'label': 'CI/CD Pipeline'},
      {'value': '100%', 'label': 'Code Quality'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        alignment: WrapAlignment.center,
        children: metrics.asMap().entries.map((entry) {
          return ConstrainedBox(
            constraints: BoxConstraints(minWidth: isMobile ? (MediaQuery.of(context).size.width - 72) / 2 : 200),
            child: _MetricCard(value: entry.value['value']!, label: entry.value['label']!, index: entry.key),
          );
        }).toList(),
      ),
    );
  }
}

class _WorkflowStepItem extends StatefulWidget {
  final WorkflowStepModel step;
  final int index;

  const _WorkflowStepItem({required this.step, required this.index});

  @override
  State<_WorkflowStepItem> createState() => _WorkflowStepItemState();
}

class _WorkflowStepItemState extends State<_WorkflowStepItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Icon Circle
                AnimatedScale(
                  scale: isHovered ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOutBack,
                  child: AnimatedRotation(
                    turns: isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Glow
                        AnimatedOpacity(
                          opacity: isHovered ? 0.3 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: widget.step.gradient,
                              boxShadow: [BoxShadow(color: widget.step.color.withAlpha(128), blurRadius: 20, spreadRadius: 10)],
                            ),
                          ),
                        ),
                        // Main Icon Circle
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: widget.step.gradient,
                            boxShadow: [BoxShadow(color: Colors.black.withAlpha(77), blurRadius: 10, offset: const Offset(0, 4))],
                          ),
                          child: Icon(widget.step.icon, color: Colors.white, size: 36),
                        ),
                      ],
                    ),
                  ),
                ),

                // Hover Popup
                Positioned(
                  top: 160,
                  child: AnimatedOpacity(
                    opacity: isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: IgnorePointer(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 192, // w-48
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A).withAlpha(242), // slate-900/95
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFA855F7).withAlpha(77)), // purple-500/30
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.step.details.map((detail) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('▸', style: TextStyle(color: Color(0xFFA855F7), fontSize: 12)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(detail, style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 12)),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.step.title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.step.description,
              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileWorkflowCard extends StatefulWidget {
  final WorkflowStepModel step;

  const _MobileWorkflowCard({required this.step});

  @override
  State<_MobileWorkflowCard> createState() => _MobileWorkflowCardState();
}

class _MobileWorkflowCardState extends State<_MobileWorkflowCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withAlpha(128), // slate-900/50
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isHovered ? const Color(0xFFA855F7).withAlpha(102) : const Color(0xFFA855F7).withAlpha(51)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedRotation(
              turns: isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(gradient: widget.step.gradient, borderRadius: BorderRadius.circular(12)),
                child: Icon(widget.step.icon, color: Colors.white, size: 28),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.step.title,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(widget.step.description, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14)),
                  const SizedBox(height: 12),
                  ...widget.step.details.map((detail) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('▸', style: TextStyle(color: Color(0xFFA855F7), fontSize: 12)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(detail, style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 12)),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatefulWidget {
  final String value;
  final String label;
  final int index;

  const _MetricCard({required this.value, required this.label, required this.index});

  @override
  State<_MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<_MetricCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: isHovered
            ? (Matrix4.identity()
                ..translate(0.0, -5.0)
                ..scale(1.05))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [const Color(0xFFA855F7).withAlpha(26), const Color(0xFF22D3EE).withAlpha(26)]),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isHovered ? const Color(0xFFA855F7).withAlpha(102) : const Color(0xFFA855F7).withAlpha(51)),
        ),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
              child: Text(
                widget.value,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms, delay: (1000 + widget.index * 100).ms).scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1));
  }
}

class _WorkflowGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFA855F7).withAlpha(77)
      ..strokeWidth = 1.0;

    const double step = 100;

    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ConnectionLinePainter extends CustomPainter {
  final int stepCount;

  _ConnectionLinePainter({required this.stepCount});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(Offset.zero & size)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final cellWidth = size.width / stepCount;
    final y = 40.0; // Half of icon height (80)

    for (int i = 0; i < stepCount - 1; i++) {
      final startX = (i * cellWidth) + (cellWidth / 2) + 40; // 40 is half of 80 icon
      final endX = ((i + 1) * cellWidth) + (cellWidth / 2) - 40;

      _drawDashedLine(canvas, Offset(startX, y), Offset(endX, y), paint);
    }
  }

  void _drawDashedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    const double dashWidth = 10, dashSpace = 5;
    double distance = (p2 - p1).distance;
    double currentDistance = 0;
    while (currentDistance < distance) {
      canvas.drawLine(p1 + (p2 - p1) * (currentDistance / distance), p1 + (p2 - p1) * ((currentDistance + dashWidth) / distance), paint);
      currentDistance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WorkflowStepModel {
  final IconData icon;
  final String title;
  final String description;
  final List<String> details;
  final Color color;
  final LinearGradient gradient;

  WorkflowStepModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.details,
    required this.color,
    required this.gradient,
  });
}

final List<WorkflowStepModel> workflowSteps = [
  WorkflowStepModel(
    icon: Icons.lightbulb_outline,
    title: "Design",
    description: "UI/UX Design & Prototyping",
    details: ["Wireframing", "User Research", "Design Systems"],
    color: const Color(0xFFF59E0B),
    gradient: const LinearGradient(colors: [Color(0xFFEAB308), Color(0xFFF97316)]),
  ),
  WorkflowStepModel(
    icon: Icons.code,
    title: "Development",
    description: "Clean Code Implementation",
    details: ["Flutter Development", "State Management", "API Integration"],
    color: const Color(0xFF3B82F6),
    gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF6366F1)]),
  ),
  WorkflowStepModel(
    icon: Icons.bug_report_outlined,
    title: "Testing",
    description: "Quality Assurance",
    details: ["Unit Testing", "Widget Testing", "Integration Testing"],
    color: const Color(0xFF10B981),
    gradient: const LinearGradient(colors: [Color(0xFF22C55E), Color(0xFF10B981)]),
  ),
  WorkflowStepModel(
    icon: Icons.rocket_launch_outlined,
    title: "Deployment",
    description: "App Store Release",
    details: ["Play Store", "App Store", "Version Management"],
    color: const Color(0xFFA855F7),
    gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFFEC4899)]),
  ),
  WorkflowStepModel(
    icon: Icons.account_tree_outlined,
    title: "CI/CD",
    description: "Continuous Integration",
    details: ["GitHub Actions", "Automated Testing", "Auto Deployment"],
    color: const Color(0xFF06B6D4),
    gradient: const LinearGradient(colors: [Color(0xFF06B6D4), Color(0xFF3B82F6)]),
  ),
  WorkflowStepModel(
    icon: Icons.check_circle_outline,
    title: "Maintenance",
    description: "Ongoing Support",
    details: ["Bug Fixes", "Updates", "Performance Monitoring"],
    color: const Color(0xFF8B5CF6),
    gradient: const LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFFA855F7)]),
  ),
];
