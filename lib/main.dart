import 'package:flutter/material.dart';
import 'package:portfolio/Certificates/certifications.dart';
import 'package:portfolio/Experience/experience.dart';
import 'package:portfolio/Footer/contact.dart';
import 'package:portfolio/Publications/publications.dart';
import 'package:portfolio/shared/app_bar.dart';
import 'package:portfolio/temp.dart' as temp;
import 'Education/education.dart';
import 'Profile_About_Me/about_me.dart';
import 'Projects/showcase.dart';
import 'Skills/skills.dart';
import 'shared/shared.dart';

void main() => runApp(const PortfolioApp());
//void main() => runApp(const temp.PortfoliApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siva Kanth Reddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with TickerProviderStateMixin {
  // --- Page enter animations ---
  late final AnimationController _fadeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );
  late final AnimationController _slideController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );
  late final AnimationController _scaleController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _fadeController,
    curve: Curves.easeIn,
  );
  late final Animation<Offset> _slideAnimation = Tween(
    begin: const Offset(0, 0.3),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));
  late final Animation<double> _scaleAnimation = Tween(begin: 0.8, end: 1.0)
      .animate(
        CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
      );

  // --- Scroll + section visibility ---
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _publicationsKey = GlobalKey();
  final GlobalKey _certificationsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // ----------Constants--------------
  static const double kBottomNavHeight = 64;

  final Map<String, bool> _sectionVisibility = {
    'about': false,
    'education': false,
    'experience': false,
    'skills': false,
    'projects': false,
    'publications': false,
    'certifications': false,
    'contact': false,
  };

  bool _showToTop = false;
  int _activeBottomIndex = 0;
  bool _isOverFooter = false;
  bool _showSocialButtons = false;

  String activeTab = 'all';

  // showcase
  final _showcase = PageController();
  int _showIndex = 0;

  List<Map<String, dynamic>> get filteredProjects {
    if (activeTab == 'all') return AppData.projects;
    return AppData.projects.where((p) => p['category'] == activeTab).toList();
  }

  // --- Init ---
  @override
  void initState() {
    super.initState();
    _fadeController.forward();
    _slideController.forward();
    _scaleController.forward();
    _scrollController.addListener(_onScroll);

    // Auto-scroll the showcase
    Future.delayed(const Duration(seconds: 5), _autoScrollShowcase);
  }

  void _autoScrollShowcase() {
    if (!mounted) return;
    final next = (_showIndex + 1) % AppData.showcaseProjects.length;
    _showcase.animateToPage(
      next,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
    Future.delayed(const Duration(seconds: 5), _autoScrollShowcase);
  }

  // --- Scroll handling ---
  void _onScroll() {
    _checkSectionVisibility('about', _aboutKey);
    _checkSectionVisibility('education', _educationKey);
    _checkSectionVisibility('experience', _experienceKey);
    _checkSectionVisibility('skills', _skillsKey);
    _checkSectionVisibility('projects', _projectsKey);
    _checkSectionVisibility('publications', _publicationsKey);
    _checkSectionVisibility('certifications', _certificationsKey);
    _checkSectionVisibility('contact', _contactKey);

    final show = _scrollController.offset > 300;
    if (show != _showToTop) setState(() => _showToTop = show);

    final index = _detectActiveSectionIndex();
    if (index != _activeBottomIndex) setState(() => _activeBottomIndex = index);

    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    final atFooter = current > maxScroll - 200;
    if (atFooter != _isOverFooter) setState(() => _isOverFooter = atFooter);

    // Social buttons visibility logic
    final contactContext = _contactKey.currentContext;
    bool showSocial = false;

    if (contactContext != null && current > 400) {
      final rb = contactContext.findRenderObject() as RenderBox?;
      if (rb != null) {
        final pos = rb.localToGlobal(Offset.zero);
        final screenHeight = MediaQuery.of(context).size.height;
        // Hide when contact section is visible
        showSocial = pos.dy > screenHeight * 0.3;
      }
    } else if (current > 400) {
      showSocial = true;
    }

    if (showSocial != _showSocialButtons) {
      setState(() => _showSocialButtons = showSocial);
    }
  }

  int _detectActiveSectionIndex() {
    // map only sections that are present in the bottom nav
    final navSections = [
      _homeKey,
      _aboutKey,
      _projectsKey,
      _skillsKey,
      _experienceKey,
      _educationKey,
      _contactKey,
    ];
    for (int i = 0; i < navSections.length; i++) {
      final c = navSections[i].currentContext;
      if (c == null) continue;
      final rb = c.findRenderObject() as RenderBox?;
      if (rb == null) continue;
      final pos = rb.localToGlobal(Offset.zero);
      if (pos.dy >= 0 && pos.dy < MediaQuery.of(context).size.height * 0.5) {
        return i;
      }
    }
    return _activeBottomIndex.clamp(0, navSections.length - 1);
  }

  void _checkSectionVisibility(String section, GlobalKey key) {
    if (_sectionVisibility[section] == true) return;
    final rb = key.currentContext?.findRenderObject() as RenderBox?;
    if (rb == null) return;
    final pos = rb.localToGlobal(Offset.zero);
    final screenH = MediaQuery.of(context).size.height;
    if (pos.dy < screenH * 0.75) {
      _sectionVisibility[section] = true;
      setState(() {});
    }
  }

  void _scrollToSection(GlobalKey key) {
    final c = key.currentContext;
    if (c == null) return;
    Scrollable.ensureVisible(
      c,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  // --- Dispose ---
  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _scrollController.dispose();
    _showcase.dispose();
    super.dispose();
  }

  // --- Build ---
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 750;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              if (!isDesktop) customAppBar(),
              SliverToBoxAdapter(
                child: Container(key: _homeKey, child: _buildHero(width)),
              ),
              SliverToBoxAdapter(
                child: Container(
                  key: _aboutKey,
                  child: AboutSection(visible: _sectionVisibility['about']!),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  key: _projectsKey,
                  child: ProjectShowcase(
                    controller: _showcase,
                    currentIndex: _showIndex,
                    onChanged: (i) => setState(() => _showIndex = i),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  key: _skillsKey,
                  child: SkillsSection(visible: _sectionVisibility['skills']!),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  key: _experienceKey,
                  child: ExperienceSection(
                    visible: _sectionVisibility['experience']!,
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Container(
              //     key: _projectsKey,
              //     child: ProjectsSection(
              //       visible: _sectionVisibility['projects']!,
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: Container(
                  key: _educationKey,
                  child: EducationSection(
                    visible: _sectionVisibility['education']!,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  key: _publicationsKey,
                  child: PublicationSection(
                    visible: _sectionVisibility['publications']!,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  key: _certificationsKey,
                  child: CertificationSection(
                    visible: _sectionVisibility['certifications']!,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  key: _contactKey,
                  child: ContactSection(
                    visible: _sectionVisibility['contact']!,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: _buildFooter()),
            ],
          ),

          // Floating bottom navigation (center)
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Center(
              child: FloatingNavBar(
                activeIndex: _activeBottomIndex,
                items: [
                  NavItem('Home', Icons.home, () => _scrollToSection(_homeKey)),
                  NavItem(
                    'About',
                    Icons.person,
                    () => _scrollToSection(_aboutKey),
                  ),
                  NavItem(
                    'Projects',
                    Icons.code,
                    () => _scrollToSection(_projectsKey),
                  ),
                  NavItem(
                    'Skills',
                    Icons.build,
                    () => _scrollToSection(_skillsKey),
                  ),
                  NavItem(
                    'Experience',
                    Icons.work,
                    () => _scrollToSection(_experienceKey),
                  ),
                  NavItem(
                    'Education',
                    Icons.school,
                    () => _scrollToSection(_educationKey),
                  ),
                  NavItem(
                    'Contact',
                    Icons.mail,
                    () => _scrollToSection(_contactKey),
                  ),
                ],
              ),
            ),
          ),

          if (isDesktop) ...[
            Positioned(
              right: 24,
              top: MediaQuery.of(context).size.height / 2 - 120,
              child: AnimatedOpacity(
                opacity: _showSocialButtons ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: AnimatedSlide(
                  offset: _showSocialButtons ? Offset.zero : const Offset(2, 0),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: IgnorePointer(
                    ignoring: !_showSocialButtons,
                    child: Column(
                      children: [
                        _buildFloatingSocialButton(
                          'assets/githublogo.png',
                          'GitHub',
                          () => launchURL('https://github.com/sivakanth1'),
                          Colors.black,
                        ),
                        const SizedBox(height: 16),
                        _buildFloatingSocialButton(
                          'assets/linkedinLogo2.png',
                          'LinkedIn',
                          () => launchURL(
                            'https://www.linkedin.com/in/sivakanth1',
                          ),
                          const Color(0xFF0077B5),
                        ),
                        const SizedBox(height: 16),
                        _buildFloatingSocialButton(
                          'assets/gmaillogo.png',
                          'Email',
                          () => launchURL(
                            'mailto:k.l.sivakanthreddy01@gmail.com',
                          ),
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],

          // Scroll-to-top button (bottom-right, kept above the nav)
          Positioned(
            right: 16,
            bottom: 16 + kBottomNavHeight,
            child: AnimatedScale(
              scale: _showToTop ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: ScrollToTopButton(
                onTap: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                },
                isWhite: _isOverFooter, // switch background over dark footer
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------- FLoating Social Icons --------------
  Widget _buildFloatingSocialButton(
    String imagePath,
    String tooltip,
    VoidCallback onTap,
    Color accentColor,
  ) {
    // Determine styling based on platform
    Color backgroundColor;
    EdgeInsets padding;
    bool hasCustomBackground = false;

    if (imagePath.contains('github')) {
      backgroundColor = Colors.black;
      padding = const EdgeInsets.all(13);
      hasCustomBackground = true;
    } else if (imagePath.contains('Linkedin') ||
        imagePath.contains('linkedin')) {
      backgroundColor = const Color(0xFF0A66C2); // Official LinkedIn blue
      padding = const EdgeInsets.all(13);
      hasCustomBackground = true;
    } else if (imagePath.contains('gmail')) {
      backgroundColor = Colors.white;
      padding = const EdgeInsets.all(11);
      hasCustomBackground = false;
    } else {
      backgroundColor = Colors.white;
      padding = const EdgeInsets.all(12);
      hasCustomBackground = false;
    }

    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        elevation: 8,
        shadowColor: accentColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 56,
            height: 56,
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: hasCustomBackground
                    ? Colors.transparent
                    : Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                errorBuilder: (_, __, ___) => Icon(
                  tooltip.contains('GitHub')
                      ? Icons.code
                      : tooltip.contains('LinkedIn')
                      ? Icons.business
                      : Icons.email,
                  color: hasCustomBackground ? Colors.white : accentColor,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---------- Hero Section and Footer ----------

  Widget _buildHero(double width) {
    final isMobile = width < 600;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade50,
                Colors.indigo.shade50,
                Colors.purple.shade50,
              ],
            ),
          ),
          child: Stack(
            children: [
              _blob(top: 80, left: 40, color: Colors.blue.shade200, size: 300),
              _blob(
                top: 160,
                right: 40,
                color: Colors.indigo.shade200,
                size: 300,
                delay: 700,
              ),
              _blob(
                bottom: -30,
                left: width / 2,
                color: Colors.purple.shade200,
                size: 300,
                delay: 1000,
              ),
              Padding(
                padding: EdgeInsets.all(pad(context)),
                child: LayoutBuilder(
                  builder: (_, __) {
                    final body = Column(
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        _availability(),
                        const SizedBox(height: 24),
                        _nameTitle(isMobile: isMobile),
                        const SizedBox(height: 24),
                        _actions(isMobile: isMobile),
                        const SizedBox(height: 24),
                        _social(),
                        const SizedBox(height: 48),
                      ],
                    );

                    if (width >= 900) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: _profileImage(500)),
                          const SizedBox(width: 60),
                          Expanded(child: body),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        const SizedBox(height: 40),
                        _profileImage(isMobile ? 240 : 340),
                        const SizedBox(height: 24),
                        body,
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _blob({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required Color color,
    required double size,
    int delay = 0,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 2000 + delay),
        curve: Curves.easeInOut,
        builder: (_, __, ___) {
          return AnimatedOpacity(
            opacity: 0.3,
            duration: const Duration(seconds: 2),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _profileImage(double size) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Image.asset(
              'assets/siva.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade600, Colors.indigo.shade600],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'SKR',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _availability() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.terminal, size: 16, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Text(
            'Available for Opportunities',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _nameTitle({required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1000),
          builder: (_, value, child) => Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: const Text(
                'Siva Kanth Reddy',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.blue.shade600, Colors.indigo.shade600],
          ).createShader(bounds),
          child: const Text(
            'Application & Software Developer',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _actions({required bool isMobile}) {
    button(String label, IconData icon, bool primary, VoidCallback onTap) =>
        Button(label: label, icon: icon, isPrimary: primary, onPressed: onTap);

    if (isMobile) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: button(
              'Download Resume',
              Icons.download,
              true,
              () => launchURL(
                "https://drive.google.com/file/d/1kIW_IA1SPITQjWhzKx30SedW_u7UugPN/view?usp=sharing",
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: button(
              'Get in Touch',
              Icons.phone,
              false,
              () => launchURL('telto:+13616961805'),
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        button(
          'Download Resume',
          Icons.download,
          true,
          () => launchURL(
            "https://drive.google.com/file/d/1kIW_IA1SPITQjWhzKx30SedW_u7UugPN/view?usp=sharing",
          ),
        ),
        const SizedBox(width: 12),
        button(
          'Get in Touch',
          Icons.email,
          false,
          () => launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
        ),
      ],
    );
  }

  Widget _social() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Social(
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            child: Center(
              child: Image.asset(
                'assets/githublogo.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Center(child: Icon(Icons.code)),
              ),
            ),
          ),
          onPressed: () => launchURL('https://github.com/sivakanth1'),
        ),
        const SizedBox(width: 16),
        Social(
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Center(
              child: Image.asset(
                'assets/Linkedinlogo.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Center(child: Icon(Icons.business)),
              ),
            ),
          ),
          onPressed: () => launchURL('https://www.linkedin.com/in/sivakanth1'),
        ),
        const SizedBox(width: 16),
        Social(
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset(
                'assets/gmaillogo.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Center(child: Icon(Icons.business)),
              ),
            ),
          ),
          onPressed: () => launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        // space so floating nav never covers the footer text
        bottom: kBottomNavHeight + 32 + bottomSafe,
      ),
      color: Colors.grey.shade900,
      child: Text(
        '© 2025 Siva Kanth Reddy. Designed & Developed with passion.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }

  // ---------- End Hero Section and Footer ----------
}
