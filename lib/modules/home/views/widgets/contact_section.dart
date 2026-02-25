import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/portfolio_data.dart';
import 'premium_hover_card.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool isMobile = width < 950;

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
                  "Let's Connect",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isMobile ? 36 : 56, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Have a project in mind? Let's discuss how I can help bring your ideas to life",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isMobile ? 14 : 18, color: Colors.white.withAlpha(150)),
              ),
              const SizedBox(height: 80),

              // 2 Column Layout
              isMobile
                  ? Column(
                      children: [
                        _buildMessageForm(isMobile),
                        const SizedBox(height: 48),
                        _buildContactInfo(isMobile),
                      ],
                    )
                  : IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(flex: 5, child: _buildMessageForm(isMobile)),
                          const SizedBox(width: 48),
                          Expanded(flex: 5, child: _buildContactInfo(isMobile)),
                        ],
                      ),
                    ),

              const SizedBox(height: 80),

              // GitHub Activity Bar
              _buildGitHubActivityBar(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageForm(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withAlpha(180),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send a Message',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 32),
          const _ContactField(label: 'Your Name', hint: 'John Doe'),
          const SizedBox(height: 20),
          const _ContactField(label: 'Your Email', hint: 'john@example.com'),
          const SizedBox(height: 20),
          const _ContactField(label: 'Your Message', hint: 'Tell me about your project...', maxLines: 4),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFA855F7), Color(0xFF6366F1), Color(0xFF0EA5E9)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: const Color(0xFFA855F7).withAlpha(80), blurRadius: 15, offset: const Offset(0, 4))],
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Send Message', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Icon(Icons.send_rounded, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return Column(
      children: [
        // Basic Info Cards
        _InfoItemCard(icon: Icons.location_on_rounded, label: 'Location', value: PortfolioData.location, color: const Color(0xFFA855F7)),
        const SizedBox(height: 12),
        _InfoItemCard(icon: Icons.email_rounded, label: 'Email', value: PortfolioData.email, color: const Color(0xFF6366F1)),
        const SizedBox(height: 12),
        _InfoItemCard(icon: Icons.phone_rounded, label: 'Phone', value: PortfolioData.phone, color: const Color(0xFF0EA5E9)),
        const SizedBox(height: 32),
        // Social Grid
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A).withAlpha(180),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withAlpha(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Connect on Social',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const _SocialRow(icon: Icons.code_rounded, label: 'GitHub', username: '@sswtsrv', color: Color(0xFF475569)),
              const SizedBox(height: 12),
              const _SocialRow(icon: Icons.link_rounded, label: 'LinkedIn', username: 'shashwat-srivastava-flutter', color: Color(0xFF0077B5)),
              const SizedBox(height: 12),
              const _SocialRow(icon: Icons.flutter_dash_rounded, label: 'Twitter', username: '@sswtsrv', color: Color(0xFF1DA1F2)),
              const SizedBox(height: 12),
              _SocialRow(icon: Icons.email_outlined, label: 'Email', username: PortfolioData.email, color: const Color(0xFFEC4899)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGitHubActivityBar(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withAlpha(150),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(20)),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildActivityHeader(),
                const SizedBox(height: 32),
                _buildStatItem('50+', 'Repositories'),
                const SizedBox(height: 24),
                _buildStatItem('1K+', 'Contributions'),
                const SizedBox(height: 24),
                _buildStatItem('20+', 'Projects'),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActivityHeader(),
                Row(
                  children: [
                    _buildStatItem('50+', 'Repositories'),
                    const SizedBox(width: 60),
                    _buildStatItem('1K+', 'Contributions'),
                    const SizedBox(width: 60),
                    _buildStatItem('20+', 'Projects'),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildActivityHeader() {
    return Row(
      children: [
        const Icon(Icons.code_rounded, color: Color(0xFF8B5CF6), size: 24),
        const SizedBox(width: 16),
        const Text(
          'GitHub Activity',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.white.withAlpha(120))),
      ],
    );
  }
}

class _SocialRow extends StatefulWidget {
  final IconData icon;
  final String label;
  final String username;
  final Color color;

  const _SocialRow({required this.icon, required this.label, required this.username, required this.color});

  @override
  State<_SocialRow> createState() => _SocialRowState();
}

class _SocialRowState extends State<_SocialRow> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return PremiumHoverCard(
      borderRadius: 16,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: widget.color.withAlpha(20),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: widget.color.withAlpha(40)),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.color,
                size: 20,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.label, style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 11)),
                  Text(widget.username, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withAlpha(50), size: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItemCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoItemCard({required this.icon, required this.label, required this.value, required this.color});

  @override
  State<_InfoItemCard> createState() => _InfoItemCardState();
}

class _InfoItemCardState extends State<_InfoItemCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return PremiumHoverCard(
      borderRadius: 24,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A).withAlpha(180),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withAlpha(10)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: widget.color.withAlpha(30), shape: BoxShape.circle),
                child: Icon(
                  widget.icon,
                  color: widget.color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.label, style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(widget.value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;

  const _ContactField({required this.label, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextField(
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withAlpha(50)),
            filled: true,
            fillColor: Colors.black.withAlpha(50),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withAlpha(20)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF8B5CF6)),
            ),
          ),
        ),
      ],
    );
  }
}
