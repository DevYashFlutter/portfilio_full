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
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: isMobile ? 24 : 40),
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
                  child: Text(
                    'Development Workflow',
                    style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 60),
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _WorkflowStep(title: 'Ideation', colors: [Color(0xFFA855F7), Color(0xFF7C3AED)]),
                    if (!isMobile) _PipelineConnector(),
                    if (isMobile) const SizedBox(height: 12),
                    const _WorkflowStep(title: 'Design', colors: [Color(0xFF7C3AED), Color(0xFF6366F1)]),
                    if (!isMobile) _PipelineConnector(),
                    if (isMobile) const SizedBox(height: 12),
                    const _WorkflowStep(title: 'Code', colors: [Color(0xFF6366F1), Color(0xFF3B82F6)]),
                    if (!isMobile) _PipelineConnector(),
                    if (isMobile) const SizedBox(height: 12),
                    const _WorkflowStep(title: 'Testing', colors: [Color(0xFF3B82F6), Color(0xFF22D3EE)]),
                    if (!isMobile) _PipelineConnector(),
                    if (isMobile) const SizedBox(height: 12),
                    const _WorkflowStep(title: 'Launch', colors: [Color(0xFF22D3EE), Color(0xFF10B981)]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkflowStep extends StatefulWidget {
  final String title;
  final List<Color> colors;

  const _WorkflowStep({required this.title, required this.colors});

  @override
  State<_WorkflowStep> createState() => _WorkflowStepState();
}

class _WorkflowStepState extends State<_WorkflowStep> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: isHovered ? Matrix4.diagonal3Values(1.1, 1.1, 1.0) : Matrix4.identity(),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: widget.colors),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: widget.colors[0].withAlpha(isHovered ? 150 : 80), blurRadius: isHovered ? 20 : 10, spreadRadius: 2)],
        ),
        child: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 600)).scale(begin: const Offset(0.8, 0.8));
  }
}

class _PipelineConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white.withAlpha(50), Colors.white.withAlpha(150), Colors.white.withAlpha(50)])),
    ).animate().fadeIn(duration: const Duration(milliseconds: 1000));
  }
}
