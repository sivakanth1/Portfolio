import 'package:flutter/material.dart';
import 'package:portfolio/shared/shared.dart';

//---------------- Appear ---------------------------//
class Appear extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  const Appear({super.key, required this.child, required this.isVisible});
  @override
  State<Appear> createState() => _AppearState();
}

class _AppearState extends State<Appear> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );
  late final Animation<double> _fade = CurvedAnimation(
    parent: _c,
    curve: Curves.easeIn,
  );
  late final Animation<Offset> _slide = Tween(
    begin: const Offset(0, .1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOut));

  @override
  void didUpdateWidget(covariant Appear oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && !oldWidget.isVisible) _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _fade,
    child: SlideTransition(position: _slide, child: widget.child),
  );
}

//----------------End Appear ---------------------------//
//--------------- Profile Image Shape Clipper -----------------------//
class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size s) {
    final p = Path();
    final w = s.width, h = s.height;
    p.moveTo(w * 0.15, 0);
    p.cubicTo(w * 0.3, 0, w * 0.35, h * 0.05, w * 0.5, h * 0.05);
    p.cubicTo(w * 0.65, h * 0.05, w * 0.7, 0, w * 0.85, 0);
    p.cubicTo(w, 0, w, h * 0.15, w, h * 0.3);
    p.cubicTo(w, h * 0.5, w, h * 0.7, w, h * 0.85);
    p.cubicTo(w, h, w * 0.85, h, w * 0.7, h);
    p.cubicTo(w * 0.5, h, w * 0.3, h, w * 0.15, h);
    p.cubicTo(0, h, 0, h * 0.85, 0, h * 0.7);
    p.cubicTo(0, h * 0.5, 0, h * 0.3, 0, h * 0.15);
    p.cubicTo(0, 0, 0, 0, w * 0.15, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//--------------- End Profile Image Shape Clipper -----------------------//
//--------------- Profile section Button-----------------------//
class Button extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onPressed;
  const Button({
    super.key,
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onPressed,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 180),
  );
  late final Animation<double> _scale = Tween(
    begin: 1.0,
    end: 0.96,
  ).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut));
  bool _hover = false;

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTapDown: (_) => _c.forward(),
        onTapUp: (_) {
          _c.reverse();
          widget.onPressed();
        },
        onTapCancel: () => _c.reverse(),
        child: ScaleTransition(
          scale: _scale,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              color: widget.isPrimary
                  ? Colors.grey.shade900
                  : Colors.transparent,
              border: widget.isPrimary
                  ? null
                  : Border.all(color: Colors.grey.shade900, width: 2),
              borderRadius: BorderRadius.circular(12),
              boxShadow: _hover && widget.isPrimary
                  ? [
                      BoxShadow(
                        color: Colors.grey.shade900.withOpacity(0.28),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 20,
                  color: widget.isPrimary ? Colors.white : Colors.grey.shade900,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.isPrimary
                        ? Colors.white
                        : Colors.grey.shade900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//--------------- End Profile section Button-----------------------//
//--------------- Social Icons -----------------------//
class Social extends StatefulWidget {
  final Widget icon;
  final VoidCallback onPressed;
  const Social({super.key, required this.icon, required this.onPressed});

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final Animation<double> _y = Tween(
    begin: 0.0,
    end: -8.0,
  ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOut));

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _c.forward(),
      onExit: (_) => _c.reverse(),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedBuilder(
          animation: _y,
          builder: (_, __) => Transform.translate(
            offset: Offset(0, _y.value),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: widget.icon,
            ),
          ),
        ),
      ),
    );
  }
}

//--------------- End Social Icons -----------------------//
//--------------- EducationCard -----------------------//
class EducationCard extends StatefulWidget {
  final Map<String, dynamic> education;
  const EducationCard({super.key, required this.education});

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: -8.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 240,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Icon(
                          widget.education['icon'] as IconData,
                          color: Colors.blue.shade600,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.education['degree'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.education['school'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 2,
                    width: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade400, Colors.blue.shade200],
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 13,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.education['location'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 13,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.education['period'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

//--------------- End EducationCard -----------------------//
//--------------- Experience Card -----------------------//
class ExperienceCard extends StatefulWidget {
  final Map<String, dynamic> experience;
  const ExperienceCard({super.key, required this.experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: -8.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 380,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Text(
                      widget.experience['period'],
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.experience['role'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.business,
                        size: 14,
                        color: Colors.blue.shade600,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          widget.experience['company'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 2,
                    width: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade400, Colors.blue.shade200],
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (widget.experience['achievements'] as List)
                            .map((achievement) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      margin: const EdgeInsets.only(top: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade600,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        achievement,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade700,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })
                            .toList(),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.experience['location'],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

//--------------- End Experience Card -----------------------//
//--------------- Publication Card -----------------------//
class PublicationCard extends StatelessWidget {
  final Map<String, String> publication;
  const PublicationCard({super.key, required this.publication});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Icon(Icons.article, color: Colors.green.shade600, size: 24),
          ),
          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  publication['title']!,
                  style: TextStyle(
                    fontSize: isMobile ? 15 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),

                // Journal link
                InkWell(
                  onTap: () => launchURL(publication['url']!),
                  child: Text(
                    publication['journal']!,
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 14,
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // Details and year
                Text(
                  '${publication['details']} • ${publication['year']}',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // Open button
          IconButton(
            tooltip: 'Open publication',
            onPressed: () => launchURL(publication['url']!),
            icon: Icon(
              Icons.open_in_new,
              color: Colors.blue.shade600,
              size: 20,
            ),
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

//--------------- End Publication Card -----------------------//
//--------------- Showcase Card -----------------------//
class ShowcaseCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final bool isMobile;

  const ShowcaseCard({
    super.key,
    required this.project,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    // ONLY CHANGE: Use mobile description if available, otherwise fall back to full description
    final displayText = isMobile && project['mobileDescription'] != null
        ? project['mobileDescription']
        : '${project['description']}\n\n${project['details']}';

    if (isMobile) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.indigo.shade600],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Image.asset(
                project['image'],
                fit: BoxFit.fill,
                errorBuilder: (_, __, ___) => Center(
                  child: Icon(
                    Icons.code,
                    size: 120,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project['period'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          displayText, // ONLY CHANGE: Uses mobile description if available
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (project['tech'] as List).map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.code, size: 16),
                      label: const Text('View on GitHub'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade900,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Desktop layout - COMPLETELY UNCHANGED from your original code
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade400, Colors.indigo.shade600],
                ),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    project['image'],
                    fit: BoxFit.fill,
                    errorBuilder: (_, __, ___) => Center(
                      child: Icon(
                        Icons.code,
                        size: 120,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project['title'],
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          project['period'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Project Details',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project['description'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project['details'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Technologies Used',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: (project['tech'] as List).map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      launchURL(project['github']);
                    },
                    icon: const Icon(Icons.code, size: 18),
                    label: const Text('View on GitHub'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade900,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//--------------- End Showcase Card -----------------------//
//--------------- Skill Card -----------------------//
class SkillCard extends StatefulWidget {
  final String title;
  final List<String> skills;
  final double width;

  const SkillCard({
    super.key,
    required this.title,
    required this.skills,
    required this.width,
  });

  @override
  State<SkillCard> createState() => __SkillCardState();
}

class __SkillCardState extends State<SkillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: -8.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: widget.width,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.grey.shade50, Colors.white],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _getIconForCategory(widget.title),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.skills.map((skill) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Text(
                          skill,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getIconForCategory(String category) {
    IconData icon;
    Color color;

    if (category.contains('Programming')) {
      icon = Icons.code;
      color = Colors.blue.shade600;
    } else if (category.contains('Database')) {
      icon = Icons.storage;
      color = Colors.purple.shade600;
    } else if (category.contains('AI/ML')) {
      icon = Icons.psychology;
      color = Colors.green.shade600;
    } else if (category.contains('Software')) {
      icon = Icons.layers;
      color = Colors.orange.shade600;
    } else if (category.contains('Cloud')) {
      icon = Icons.cloud;
      color = Colors.indigo.shade600;
    } else if (category.contains('Data')) {
      icon = Icons.bar_chart;
      color = Colors.pink.shade600;
    } else {
      icon = Icons.computer;
      color = Colors.grey.shade600;
    }

    return Icon(icon, color: color, size: 24);
  }
}

//--------------- End Skills Card -----------------------//
//--------------- Project Card -----------------------//
class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final double width;
  const ProjectCard({super.key, required this.project, required this.width});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _hover = false;
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final Animation<double> _y = Tween(
    begin: 0.0,
    end: -8.0,
  ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOut));

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cat = widget.project['category'] as String;
    return MouseRegion(
      onEnter: (_) {
        _hover = true;
        _c.forward();
        setState(() {});
      },
      onExit: (_) {
        _hover = false;
        _c.reverse();
        setState(() {});
      },
      child: AnimatedBuilder(
        animation: _y,
        builder: (_, __) => Transform.translate(
          offset: Offset(0, _y.value),
          child: Container(
            width: widget.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(_hover ? 0.18 : 0.08),
                  blurRadius: _hover ? 36 : 20,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _chip(
                        widget.project['year'],
                        Colors.grey.shade600,
                        bg: Colors.grey.shade100,
                      ),
                      _chip(
                        cat,
                        cat == 'application'
                            ? Colors.blue.shade700
                            : Colors.purple.shade700,
                        bg: cat == 'application'
                            ? Colors.blue.shade100
                            : Colors.purple.shade100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.project['title'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: _hover ? Colors.blue.shade600 : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.project['description'],
                    style: TextStyle(color: Colors.grey.shade600, height: 1.6),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Key Highlights:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ...(widget.project['highlights'] as List).map(
                    (h) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '✓',
                            style: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              h,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (widget.project['tech'] as List)
                        .map<Widget>(
                          (t) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Text(
                              t,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.open_in_new,
                        size: 16,
                        color: Colors.blue.shade600,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'View Details',
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _chip(String text, Color color, {required Color bg}) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600),
    ),
  );
}

//--------------- End Project Card -----------------------//
//--------------- Filter Pill -----------------------//
class FilterPill extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onPressed;
  const FilterPill({
    super.key,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  State<FilterPill> createState() => _FilterPillState();
}

class _FilterPillState extends State<FilterPill> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.isActive;
    final bg = active ? Colors.black87 : Colors.grey.shade100;
    final fg = active ? Colors.white : Colors.grey.shade900;
    final border = active ? null : Border.all(color: Colors.grey.shade200);

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
            border: border,
            boxShadow: active || _hover
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(active ? 0.28 : 0.08),
                      blurRadius: active ? 18 : 10,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: TextStyle(color: fg, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

//--------------- End Filter Pill -----------------------//
//--------------- Certifications Card -----------------------//
class CertCard extends StatefulWidget {
  final String title;
  final double width;
  const CertCard({super.key, required this.title, required this.width});

  @override
  State<CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<CertCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: -8.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: widget.width,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 18,
                          offset: const Offset(0, 10),
                        ),
                      ],
              ),
              child: Row(
                children: [
                  Icon(Icons.verified, color: Colors.indigo.shade600, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

//--------------- End Certifications Card -----------------------//
//--------------- Contact Card -----------------------//
class ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final double width;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.width,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          width: widget.width,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hover ? Colors.grey.shade400 : Colors.grey.shade200,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_hover ? 0.12 : 0.06),
                blurRadius: _hover ? 24 : 12,
                offset: Offset(0, _hover ? 12 : 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: Colors.grey.shade800),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: Colors.grey.shade600, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

//--------------- End Contact Card -----------------------//
//--------------- NavItem -----------------------//
class NavItem {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  NavItem(this.label, this.icon, this.onTap);
}

//--------------- End NavItem -----------------------//
//--------------- Floating Nav Bar -----------------------//
class FloatingNavBar extends StatelessWidget {
  final List<NavItem> items;
  final int activeIndex;

  const FloatingNavBar({
    super.key,
    required this.items,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final showLabels = w >= 480; // icons only on very small screens
    final maxBarWidth = w.clamp(280.0, 900.0);

    return Container(
      constraints: BoxConstraints(maxWidth: maxBarWidth),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(items.length, (i) {
            final item = items[i];
            final active = i == activeIndex;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: item.onTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: EdgeInsets.symmetric(
                    horizontal: active
                        ? (showLabels ? 14 : 10)
                        : (showLabels ? 12 : 10),
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: active ? Colors.black87 : Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item.icon,
                        size: 18,
                        color: active ? Colors.white : Colors.black87,
                      ),
                      if (showLabels) ...[
                        const SizedBox(width: 6),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: active ? Colors.white : Colors.black87,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

//--------------- End Floating Nav Bar-----------------------//
//--------------- Scroll to Bottom -----------------------//
class ScrollToTopButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isWhite;

  const ScrollToTopButton({
    super.key,
    required this.onTap,
    this.isWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isWhite ? Colors.white : Colors.black87;
    final iconColor = isWhite ? Colors.black87 : Colors.white;

    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(Icons.keyboard_arrow_up, color: iconColor, size: 28),
        ),
      ),
    );
  }
}

//--------------- End Scroll to Bottom -----------------------//
//--------------- Arrow Button -----------------------//
class ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const ArrowButton({super.key, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black87,
      elevation: 4,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}

//--------------- End Arrow Button -----------------------//
