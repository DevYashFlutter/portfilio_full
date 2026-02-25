import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PremiumHoverCard extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final Widget Function(BuildContext, bool, Widget?)? iconBuilder;
  final Widget? icon;

  const PremiumHoverCard({
    super.key,
    required this.child,
    this.borderRadius = 24,
    this.iconBuilder,
    this.icon,
  });

  @override
  State<PremiumHoverCard> createState() => _PremiumHoverCardState();
}

class _PremiumHoverCardState extends State<PremiumHoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        children: [
          // The Content
          widget.child,

          // Animated Gradient Border
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isHovered ? 1.0 : 0.0,
                child: CustomPaint(
                  painter: _GradientBorderPainter(
                    radius: Radius.circular(widget.borderRadius),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFA855F7), Color(0xFF22D3EE)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Radius radius;
  final Gradient gradient;

  _GradientBorderPainter({required this.strokeWidth, required this.radius, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    RRect rrect = RRect.fromRectAndRadius(rect, radius);
    Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Adjust rect slightly to keep border inside
    RRect innerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(strokeWidth / 2, strokeWidth / 2, size.width - strokeWidth, size.height - strokeWidth),
      radius,
    );
    canvas.drawRRect(innerRRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Helper extension or widget for the rotating icon
extension HoverRotation on Widget {
  Widget animateHoverRotation(bool isHovered) {
    return this.animate(target: isHovered ? 1 : 0)
      .rotate(
        begin: 0,
        end: 10,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
  }
}
