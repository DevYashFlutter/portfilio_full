import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/portfolio_data.dart';
import 'package:portfolio/utils/responsive.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: _buildFloatingContactButton(),
      body: Stack(
        children: [
          // Background effects
          _buildBackground(),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(children: [_buildHeader(isMobile), const SizedBox(height: 60), _buildMainContent(context, isMobile, isTablet)]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
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
        child: Stack(
          children: [
            // Purple Glow
            Positioned(
              top: 100,
              left: -100,
              child:
                  Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(color: const Color(0xFFA855F7).withOpacity(0.1), shape: BoxShape.circle),
                      )
                      .animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 8.seconds)
                      .blurXY(begin: 80, end: 100),
            ),
            // Cyan Glow
            Positioned(
              bottom: 100,
              right: -100,
              child:
                  Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(color: const Color(0xFF22D3EE).withOpacity(0.1), shape: BoxShape.circle),
                      )
                      .animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .scale(begin: const Offset(1.2, 1.2), end: const Offset(1, 1), duration: 8.seconds)
                      .blurXY(begin: 100, end: 80),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
            child: Text(
              "Let's Connect",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: isMobile ? 40 : 56, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3, end: 0),
          const SizedBox(height: 16),
          Text(
            "Have a project in mind? Let's discuss how I can help bring your ideas to life",
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

  Widget _buildMainContent(BuildContext context, bool isMobile, bool isTablet) {
    final bool stackLayout = isMobile || isTablet;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: stackLayout
            ? Column(children: [_buildContactForm(), const SizedBox(height: 48), _buildInfoAndSocial(isMobile)])
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildContactForm()),
                  const SizedBox(width: 48),
                  Expanded(child: _buildInfoAndSocial(isMobile)),
                ],
              ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withOpacity(0.5), // slate-900/50
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFA855F7).withOpacity(0.2)), // purple-500/20
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Send a Message',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 24),
                _buildFieldLabel('Your Name'),
                _buildTextField(_nameController, "John Doe", false),
                const SizedBox(height: 20),
                _buildFieldLabel('Your Email'),
                _buildTextField(_emailController, "john@example.com", false, isEmail: true),
                const SizedBox(height: 20),
                _buildFieldLabel('Your Message'),
                _buildTextField(_messageController, "Tell me about your project...", true),
                const SizedBox(height: 32),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideX(begin: -0.1, end: 0);
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(label, style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 14)),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, bool isMultiline, {bool isEmail = false}) {
    return TextFormField(
      controller: controller,
      maxLines: isMultiline ? 6 : 1,
      style: const TextStyle(color: Colors.white),
      keyboardType: isEmail ? TextInputType.emailAddress : (isMultiline ? TextInputType.multiline : TextInputType.text),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF64748B)),
        filled: true,
        fillColor: const Color(0xFF1E293B).withOpacity(0.5), // slate-800/50
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color(0xFFA855F7).withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color(0xFFA855F7).withOpacity(0.5)),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF9333EA), Color(0xFF0891B2)], // purple-600 to cyan-600
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: const Color(0xFFA855F7).withOpacity(0.25), blurRadius: 15, offset: const Offset(0, 4))],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Handle submit
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Send Message",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            SizedBox(width: 8),
            Icon(Icons.send_rounded, size: 18, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoAndSocial(bool isMobile) {
    return Column(
      children: [
        _buildContactInfoCards(), const SizedBox(height: 24), _buildSocialCard(), const SizedBox(height: 24), _buildGitHubStatsCard()],
    ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideX(begin: 0.1, end: 0);
  }

  Widget _buildContactInfoCards() {
    final items = [
      {'icon': Icons.location_on_rounded, 'label': 'Location', 'value': 'India'},
      {'icon': Icons.mail_rounded, 'label': 'Email', 'value': PortfolioData.email},
      {'icon': Icons.phone_rounded, 'label': 'Phone', 'value': PortfolioData.phone},
    ];

    return Column(
      children: items.asMap().entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _InfoCard(icon: entry.value['icon'] as IconData, label: entry.value['label'] as String, value: entry.value['value'] as String, index: entry.key),
        );
      }).toList(),
    );
  }

  Widget _buildSocialCard() {
    final socialLinks = [
      {
        'icon': Icons.code_rounded,
        'label': 'GitHub',
        'user': '@sswtsrv',
        'color': const [Color(0xFF334155), Color(0xFF475569)],
      },
      {
        'icon': Icons.link_rounded,
        'label': 'LinkedIn',
        'user': 'shashwat-srivastava-flutter',
        'color': const [Color(0xFF2563EB), Color(0xFF3B82F6)],
      },
      {
        'icon': Icons.flutter_dash_rounded,
        'label': 'Twitter',
        'user': '@sswtsrv',
        'color': const [Color(0xFF06B6D4), Color(0xFF60A5FA)],
      },
      {
        'icon': Icons.mail_rounded,
        'label': 'Email',
        'user': PortfolioData.email,
        'color': const [Color(0xFF9333EA), Color(0xFFEC4899)],
      },
    ];

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFA855F7).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Connect on Social',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 24),
          ...socialLinks.asMap().entries.map((entry) {
            return _SocialLinkItem(
              icon: entry.value['icon'] as IconData,
              label: entry.value['label'] as String,
              username: entry.value['user'] as String,
              colors: entry.value['color'] as List<Color>,
              index: entry.key,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildGitHubStatsCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [const Color(0xFFA855F7).withOpacity(0.1), const Color(0xFF22D3EE).withOpacity(0.1)]),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFA855F7).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.code_rounded, color: Color(0xFFA855F7), size: 20),
              SizedBox(width: 8),
              Text(
                'GitHub Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat("50+", "Repositories"), _buildStat("1K+", "Contributions"), _buildStat("20+", "Projects")]),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms, delay: 800.ms).slideY(begin: 0.2, end: 0);
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFFA855F7), Color(0xFF22D3EE)]).createShader(bounds),
          child: Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
        ),
      ],
    );
  }

  Widget _buildFloatingContactButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.transparent,
      elevation: 0,
      highlightElevation: 0,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(colors: [Color(0xFF9333EA), Color(0xFF0891B2)]),
          boxShadow: [BoxShadow(color: const Color(0xFFA855F7).withOpacity(0.5), blurRadius: 20, spreadRadius: 2)],
        ),
        child: const Icon(Icons.mail_rounded, color: Colors.white, size: 28),
      ),
    ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: 2.seconds);
  }
}

class _InfoCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final int index;

  const _InfoCard({required this.icon, required this.label, required this.value, required this.index});

  @override
  State<_InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<_InfoCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        transform: Matrix4.translationValues(isHovered ? 8 : 0, 0, 0),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isHovered ? const Color(0xFFA855F7).withOpacity(0.4) : const Color(0xFFA855F7).withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color(0xFFA855F7).withOpacity(0.2), const Color(0xFF22D3EE).withOpacity(0.2)]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, color: const Color(0xFFA855F7), size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.label, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
                  Text(
                    widget.value,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: (400 + widget.index * 100).ms).slideY(begin: 0.2, end: 0);
  }
}

class _SocialLinkItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String username;
  final List<Color> colors;
  final int index;

  const _SocialLinkItem({required this.icon, required this.label, required this.username, required this.colors, required this.index});

  @override
  State<_SocialLinkItem> createState() => _SocialLinkItemState();
}

class _SocialLinkItemState extends State<_SocialLinkItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: 300.ms,
          transform: Matrix4.translationValues(isHovered ? 8 : 0, 0, 0),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withOpacity(isHovered ? 0.8 : 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isHovered ? const Color(0xFFA855F7).withOpacity(0.3) : const Color(0xFFA855F7).withOpacity(0.1)),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: 300.ms,
                width: 48,
                height: 48,
                transform: isHovered ? Matrix4.diagonal3Values(1.1, 1.1, 1.0) : Matrix4.identity(),
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: widget.colors),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(color: isHovered ? const Color(0xFFD8B4FE) : Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(widget.username, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
                  ],
                ),
              ),
              AnimatedOpacity(
                duration: 300.ms,
                opacity: isHovered ? 1.0 : 0.0,
                child: const Icon(Icons.arrow_forward_rounded, color: Color(0xFFA855F7), size: 20),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: (600 + widget.index * 100).ms).slideX(begin: 0.1, end: 0);
  }
}
