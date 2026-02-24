import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';

class AnimationsSection extends StatelessWidget {
  const AnimationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 850;

    return Container(
      width: double.infinity,
      color: AppColors.background,
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
                    'Animations',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800)),
                const SizedBox(height: 16),
                Text(
                  'Smooth, delightful micro-interactions',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 14 : 16, color: AppColors.textBody.withAlpha(200)),
                ).animate().fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200)),

                const SizedBox(height: 60),
                GridView.count(
                  crossAxisCount: isMobile ? 1 : 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isMobile ? 1.2 : 1.4,
                  children: const [
                    _AnimationCard(title: 'Gestures', icon: Icons.auto_awesome_rounded, child: _DraggablePreview()),
                    _AnimationCard(title: 'Loading', icon: Icons.bolt_rounded, child: _LoadingPreview()),
                    _AnimationCard(title: 'Interactive', icon: Icons.favorite_outline_rounded, child: _InteractivePreview()),
                    _AnimationCard(title: 'Transitions', icon: Icons.star_outline_rounded, child: _TransitionPreview()),
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

class _AnimationCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _AnimationCard({required this.title, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B).withAlpha(102),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFFA855F7), size: 18),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50), borderRadius: BorderRadius.circular(16)),
              child: child,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 800)).scale(begin: const Offset(0.9, 0.9));
  }
}

class _DraggablePreview extends StatefulWidget {
  const _DraggablePreview();

  @override
  State<_DraggablePreview> createState() => _DraggablePreviewState();
}

class _DraggablePreviewState extends State<_DraggablePreview> {
  Offset position = Offset.zero;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxX = (constraints.maxWidth - 72) / 2;
        final double maxY = (constraints.maxHeight - 72) / 2;

        return Center(
          child: MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            cursor: SystemMouseCursors.grab,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  position = Offset((position.dx + details.delta.dx).clamp(-maxX, maxX), (position.dy + details.delta.dy).clamp(-maxY, maxY));
                });
              },
              onDoubleTap: () => setState(() => position = Offset.zero),
              child: AnimatedScale(
                scale: isHovered ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Transform.translate(
                  offset: position,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: const Color(0xFFA855F7).withAlpha(isHovered ? 150 : 100), blurRadius: isHovered ? 25 : 15)],
                    ),
                    child: Tooltip(
                      message: 'Drag me! Double tap to reset',
                      child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 32),
                    ),
                  ).animate(onPlay: (controller) => controller.repeat()).shimmer(duration: const Duration(seconds: 2)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoadingPreview extends StatefulWidget {
  const _LoadingPreview();

  @override
  State<_LoadingPreview> createState() => _LoadingPreviewState();
}

class _LoadingPreviewState extends State<_LoadingPreview> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
                  width: 12,
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]),
                    borderRadius: BorderRadius.circular(6),
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat(reverse: true))
                .scaleY(
                  duration: Duration(milliseconds: isHovered ? 300 : 600),
                  delay: Duration(milliseconds: index * 150),
                  begin: 0.4,
                  end: isHovered ? 1.2 : 1.0,
                )
                .shimmer();
          }),
        ),
      ),
    );
  }
}

class _InteractivePreview extends StatefulWidget {
  const _InteractivePreview();

  @override
  State<_InteractivePreview> createState() => _InteractivePreviewState();
}

class _InteractivePreviewState extends State<_InteractivePreview> {
  bool isPressed = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => isPressed = true),
          onTapUp: (_) => setState(() => isPressed = false),
          onTapCancel: () => setState(() => isPressed = false),
          child: AnimatedScale(
            scale: isPressed ? 0.9 : (isHovered ? 1.1 : 1.0),
            duration: const Duration(milliseconds: 100),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: isHovered ? [const Color(0xFFF43F5E), const Color(0xFFC084FC)] : [const Color(0xFFE11D48), const Color(0xFFA855F7)]),
                borderRadius: BorderRadius.circular(12),
                boxShadow: isPressed
                    ? []
                    : [BoxShadow(color: const Color(0xFFE11D48).withAlpha(isHovered ? 150 : 100), blurRadius: isHovered ? 20 : 15, offset: const Offset(0, 5))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.favorite_rounded, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Interactive',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

class _TransitionPreview extends StatefulWidget {
  const _TransitionPreview();

  @override
  State<_TransitionPreview> createState() => _TransitionPreviewState();
}

class _TransitionPreviewState extends State<_TransitionPreview> {
  bool isHovered = false;
  int triggerCount = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: () => setState(() => triggerCount++),
          child: Container(
            color: Colors.transparent, // Background to catch gestures
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ...List.generate(3 + (triggerCount % 3), (index) {
                  return Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: isHovered ? const Color(0xFFF0ABFC).withAlpha(150) : const Color(0xFF22D3EE).withAlpha(100), width: 2),
                        ),
                      )
                      .animate(onPlay: (controller) => controller.repeat(), key: ValueKey('ripple_$triggerCount$index'))
                      .scale(
                        duration: Duration(seconds: isHovered ? 1 : 2),
                        delay: Duration(milliseconds: index * 400),
                        begin: const Offset(1, 1),
                        end: const Offset(15, 15),
                      )
                      .fadeOut(duration: Duration(seconds: isHovered ? 1 : 2));
                }),
                Icon(
                      triggerCount % 2 == 0 ? Icons.star_rounded : Icons.auto_awesome_rounded,
                      color: isHovered ? const Color(0xFFF0ABFC) : const Color(0xFF22D3EE),
                      size: isHovered ? 50 : 40,
                    )
                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                    .scale(duration: const Duration(seconds: 1), begin: const Offset(0.8, 0.8), end: const Offset(1.2, 1.2))
                    .rotate(duration: const Duration(seconds: 5), begin: 0, end: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
