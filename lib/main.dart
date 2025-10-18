import 'package:flutter/material.dart';

void main() => runApp(const PortfolioApp());

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
  // Page enter animations
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

  // Scroll + section visibility
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _certificationsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  final Map<String, bool> _sectionVisibility = {
    'about': false,
    'skills': false,
    'projects': false,
    'certifications': false,
    'contact': false,
  };

  bool _showToTop = false;
  int _activeBottomIndex = 0;

  String activeTab = 'all';

  // Data
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Enterprise Resource Planning System',
      'category': 'application',
      'description':
          'Built a comprehensive ERP solution for manufacturing industry with modules for inventory, HR, and finance management.',
      'tech': ['Java', 'Spring Boot', 'Angular', 'PostgreSQL', 'Docker'],
      'highlights': [
        'Reduced processing time by 40%',
        'Served 500+ concurrent users',
        'Integrated 15+ third-party APIs',
      ],
      'year': '2024',
    },
    {
      'title': 'Mobile Banking Application',
      'category': 'application',
      'description':
          'Developed cross-platform banking app with biometric authentication, real-time transactions, and financial analytics.',
      'tech': ['React Native', 'Node.js', 'MongoDB', 'AWS', 'Redux'],
      'highlights': [
        '100K+ downloads',
        '4.8★ rating on app stores',
        'PCI DSS compliant',
      ],
      'year': '2024',
    },
    {
      'title': 'AI-Powered Code Review Tool',
      'category': 'software',
      'description':
          'Created an intelligent code review system that analyzes code quality, suggests improvements, and detects vulnerabilities.',
      'tech': ['Python', 'FastAPI', 'TensorFlow', 'Redis', 'Docker'],
      'highlights': [
        'Analyzed 50K+ pull requests',
        '85% accuracy in bug detection',
        'Reduced review time by 60%',
      ],
      'year': '2023',
    },
    {
      'title': 'Cloud-Native Microservices Platform',
      'category': 'software',
      'description':
          'Architected and implemented a scalable microservices infrastructure for e-commerce platform handling millions of requests.',
      'tech': ['Go', 'Kubernetes', 'RabbitMQ', 'Elasticsearch', 'Prometheus'],
      'highlights': [
        '99.99% uptime',
        'Auto-scaling architecture',
        'Handles 10M requests/day',
      ],
      'year': '2023',
    },
    {
      'title': 'Healthcare Management System',
      'category': 'application',
      'description':
          'Developed patient management system with appointment scheduling, electronic health records, and telemedicine features.',
      'tech': ['C#', '.NET Core', 'React', 'SQL Server', 'SignalR'],
      'highlights': [
        'HIPAA compliant',
        'Integrated with 20+ hospitals',
        'Real-time notifications',
      ],
      'year': '2023',
    },
    {
      'title': 'DevOps Automation Suite',
      'category': 'software',
      'description':
          'Built comprehensive CI/CD pipeline automation tools with deployment orchestration and monitoring capabilities.',
      'tech': ['Python', 'Jenkins', 'Ansible', 'Terraform', 'Grafana'],
      'highlights': [
        'Reduced deployment time by 75%',
        'Zero-downtime deployments',
        'Multi-cloud support',
      ],
      'year': '2024',
    },
  ];

  final Map<String, List<String>> skills = {
    'Languages': [
      'Java',
      'Python',
      'C#',
      'JavaScript',
      'TypeScript',
      'Go',
      'Kotlin',
    ],
    'Frameworks': [
      'Spring Boot',
      '.NET Core',
      'React',
      'Angular',
      'Node.js',
      'FastAPI',
      'React Native',
    ],
    'Databases': ['PostgreSQL', 'MongoDB', 'MySQL', 'Redis', 'Elasticsearch'],
    'Tools': [
      'Docker',
      'Kubernetes',
      'Jenkins',
      'Git',
      'AWS',
      'Azure',
      'Terraform',
    ],
    'Specializations': [
      'Microservices',
      'Cloud Architecture',
      'Mobile Development',
      'DevOps',
      'System Design',
    ],
  };

  List<Map<String, dynamic>> get filteredProjects {
    if (activeTab == 'all') return projects;
    return projects.where((p) => p['category'] == activeTab).toList();
  }

  // Init
  @override
  void initState() {
    super.initState();
    _fadeController.forward();
    _slideController.forward();
    _scaleController.forward();

    _scrollController.addListener(_onScroll);
  }

  // Dispose
  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool _isOverFooter = false;

  // Scroll handling
  void _onScroll() {
    _checkSectionVisibility('about', _aboutKey);
    _checkSectionVisibility('skills', _skillsKey);
    _checkSectionVisibility('projects', _projectsKey);
    _checkSectionVisibility('certifications', _certificationsKey);
    _checkSectionVisibility('contact', _contactKey);

    // show scroll to top after some offset
    final show = _scrollController.offset > 300;
    if (show != _showToTop) setState(() => _showToTop = show);

    // active bottom nav index based on nearest section header
    final index = _detectActiveSectionIndex();
    if (index != _activeBottomIndex) setState(() => _activeBottomIndex = index);

    // detect footer proximity
    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    final atFooter = current > maxScroll - 200; // within ~200px of bottom

    if (atFooter != _isOverFooter) {
      setState(() => _isOverFooter = atFooter);
    }
  }

  int _detectActiveSectionIndex() {
    final sections = [
      _homeKey,
      _aboutKey,
      _skillsKey,
      _projectsKey,
      _certificationsKey,
      _contactKey,
    ];
    for (int i = 0; i < sections.length; i++) {
      final c = sections[i].currentContext;
      if (c == null) continue;
      final rb = c.findRenderObject() as RenderBox?;
      if (rb == null) continue;
      final pos = rb.localToGlobal(Offset.zero);
      if (pos.dy >= 0 && pos.dy < MediaQuery.of(context).size.height * 0.5) {
        return i;
      }
    }
    return _activeBottomIndex;
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

  // Utils
  double _pad(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w < 600) return 20;
    if (w < 1024) return 36;
    return 48;
  }

  double _skillWidth(double maxWidth) {
    if (maxWidth < 600) return maxWidth - 40;
    if (maxWidth < 1024) return (maxWidth - 60) / 2;
    return 350;
  }

  double _projectWidth(double maxWidth) {
    if (maxWidth < 600) return maxWidth - 40;
    if (maxWidth < 1024) return maxWidth - 60;
    return 500;
  }

  double _certWidth(double maxWidth) {
    if (maxWidth < 600) return maxWidth - 40;
    if (maxWidth < 1024) return maxWidth - 60;
    return 400;
  }

  double _contactWidth(double maxWidth) {
    if (maxWidth < 600) return maxWidth - 40;
    if (maxWidth < 1024) return (maxWidth - 60) / 2;
    return 280;
  }

  // Scroll to specific section
  void _scrollToSection(GlobalKey key) {
    final c = key.currentContext;
    if (c == null) return;
    Scrollable.ensureVisible(
      c,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  static const double kBottomNavHeight = 64;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      // keep only a minimal top bar title; remove text nav items
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                elevation: 2,
                backgroundColor: Colors.white.withValues(alpha: 0.95),
                title: const Text(
                  'Siva Kanth Reddy',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(key: _homeKey, child: _buildHero(width)),
              ),
              SliverToBoxAdapter(
                child: Container(key: _aboutKey, child: _buildAbout()),
              ),
              SliverToBoxAdapter(
                child: Container(key: _skillsKey, child: _buildSkills()),
              ),
              SliverToBoxAdapter(
                child: Container(key: _projectsKey, child: _buildProjects()),
              ),
              SliverToBoxAdapter(
                child: Container(key: _certificationsKey, child: _buildCerts()),
              ),
              SliverToBoxAdapter(
                child: Container(key: _contactKey, child: _buildContact()),
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
              child: _FloatingNavBar(
                activeIndex: _activeBottomIndex,
                items: [
                  NavItem('Home', Icons.home, () => _scrollToSection(_homeKey)),
                  NavItem(
                    'About',
                    Icons.person,
                    () => _scrollToSection(_aboutKey),
                  ),
                  NavItem(
                    'Skills',
                    Icons.build,
                    () => _scrollToSection(_skillsKey),
                  ),
                  NavItem(
                    'Projects',
                    Icons.work,
                    () => _scrollToSection(_projectsKey),
                  ),
                  NavItem(
                    'Certs',
                    Icons.verified,
                    () => _scrollToSection(_certificationsKey),
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

          // Scroll-to-top button (bottom-right)
          Positioned(
            right: 16,
            bottom: 16 + kBottomNavHeight,
            child: AnimatedScale(
              scale: _showToTop ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: _ScrollToTopButton(
                onTap: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                },
                // pass dynamic color flag
                isWhite: _isOverFooter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Sections ----------

  Widget _buildHero(double width) {
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

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
                padding: EdgeInsets.all(_pad(context)),
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
                    color: color.withValues(alpha: 0.3),
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
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: ClipPath(
            clipper: _CustomShapeClipper(),
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
                  fontSize:
                      48, // bigger on desktop; auto-scales by layout on mobile via wrapping
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
        _Button(label: label, icon: icon, isPrimary: primary, onPressed: onTap);

    if (isMobile) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: button('Download Resume', Icons.download, true, () {}),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: button(
              'Get in Touch',
              Icons.email,
              false,
              () => _launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        button('Download Resume', Icons.download, true, () {}),
        const SizedBox(width: 12),
        button(
          'Get in Touch',
          Icons.email,
          false,
          () => _launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
        ),
      ],
    );
  }

  Widget _social() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Social(
          icon: Icons.code,
          onPressed: () => _launchURL('https://github.com/sivakanth1'),
        ),
        const SizedBox(width: 16),
        _Social(
          icon: Icons.business,
          onPressed: () => _launchURL('https://www.linkedin.com/in/sivakanth1'),
        ),
        const SizedBox(width: 16),
        _Social(
          icon: Icons.email,
          onPressed: () => _launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
        ),
      ],
    );
  }

  Widget _buildAbout() {
    return _Appear(
      isVisible: _sectionVisibility['about']!,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: _pad(context)),
        color: Colors.white,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                const Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Get to know me better',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 36),
                _aboutBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _aboutBox() {
    final bullets = [
      'Passionate application and software developer with expertise in building scalable, enterprise-grade solutions',
      'Specialized in full-stack development, cloud architecture, and modern DevOps practices',
      'Strong problem-solving skills with a focus on writing clean, maintainable, and efficient code',
      'Experienced in agile methodologies, leading development teams, and delivering projects on time',
      'Committed to continuous learning and staying updated with emerging technologies and industry best practices',
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: bullets.asMap().entries.map((e) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade600,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    e.value,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSkills() {
    return _Appear(
      isVisible: _sectionVisibility['skills']!,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: _pad(context)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Technical Expertise',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Technologies and tools I work with',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 36),
            LayoutBuilder(
              builder: (_, cons) => Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: skills.entries
                    .map(
                      (e) => _SkillCard(
                        title: e.key,
                        skills: e.value,
                        width: _skillWidth(cons.maxWidth),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjects() {
    return _Appear(
      isVisible: _sectionVisibility['projects']!,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: _pad(context)),
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              'Featured Projects',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Solutions I\'ve built and deployed',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 28),
            // ——— ALWAYS inline pills (no full-width stacked bars) ———
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 12,
              children: [
                _FilterPill(
                  label: 'All Projects',
                  isActive: activeTab == 'all',
                  onPressed: () => setState(() => activeTab = 'all'),
                ),
                _FilterPill(
                  label: 'Application Development',
                  isActive: activeTab == 'application',
                  onPressed: () => setState(() => activeTab = 'application'),
                ),
                _FilterPill(
                  label: 'Software Development',
                  isActive: activeTab == 'software',
                  onPressed: () => setState(() => activeTab = 'software'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            LayoutBuilder(
              builder: (_, cons) => Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: filteredProjects
                    .map(
                      (p) => _ProjectCard(
                        project: p,
                        width: _projectWidth(cons.maxWidth),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCerts() {
    final certs = [
      'AWS Certified Solutions Architect',
      'Oracle Certified Professional Java Developer',
      'Microsoft Certified: Azure Developer Associate',
      'Certified Kubernetes Application Developer',
    ];
    return _Appear(
      isVisible: _sectionVisibility['certifications']!,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: _pad(context)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Certifications',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Professional credentials and achievements',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 36),
            LayoutBuilder(
              builder: (_, cons) => Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: certs
                    .map(
                      (c) =>
                          _CertCard(title: c, width: _certWidth(cons.maxWidth)),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContact() {
    return _Appear(
      isVisible: _sectionVisibility['contact']!,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: _pad(context)),
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              'Let\'s Build Something Amazing',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'I\'m currently available for freelance work and full-time opportunities.\nLet\'s discuss how I can help bring your ideas to life.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 36),
            LayoutBuilder(
              builder: (_, cons) => Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _ContactCard(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: 'k.l.sivakanthreddy01@gmail.com',
                    onPressed: () =>
                        _launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
                    width: _contactWidth(cons.maxWidth),
                  ),
                  _ContactCard(
                    icon: Icons.business,
                    title: 'LinkedIn',
                    subtitle: 'Connect with me',
                    onPressed: () =>
                        _launchURL('https://www.linkedin.com/in/sivakanth1'),
                    width: _contactWidth(cons.maxWidth),
                  ),
                  _ContactCard(
                    icon: Icons.code,
                    title: 'GitHub',
                    subtitle: 'View my code',
                    onPressed: () =>
                        _launchURL('https://github.com/sivakanth1'),
                    width: _contactWidth(cons.maxWidth),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            _Button(
              label: 'Start a Conversation',
              icon: Icons.email,
              isPrimary: true,
              onPressed: () =>
                  _launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
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

  // Launch URL stub
  void _launchURL(String url) {
    // For real links, wire url_launcher as you did before.
    debugPrint('Launching: $url');
  }
}

// ----------------- Reusable UI -----------------

class _CustomShapeClipper extends CustomClipper<Path> {
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

class _Appear extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  const _Appear({required this.child, required this.isVisible});

  @override
  State<_Appear> createState() => _AppearState();
}

class _AppearState extends State<_Appear> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );
  late final Animation<double> _fade = CurvedAnimation(
    parent: _c,
    curve: Curves.easeIn,
  );
  late final Animation<Offset> _slide = Tween(
    begin: const Offset(0, 0.1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOut));

  @override
  void didUpdateWidget(covariant _Appear oldWidget) {
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

class _Button extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onPressed;
  const _Button({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onPressed,
  });

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> with SingleTickerProviderStateMixin {
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
                        color: Colors.grey.shade900.withValues(alpha: 0.28),
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

class _Social extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _Social({required this.icon, required this.onPressed});

  @override
  State<_Social> createState() => _SocialState();
}

class _SocialState extends State<_Social> with SingleTickerProviderStateMixin {
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
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(widget.icon, color: Colors.grey.shade700, size: 24),
            ),
          ),
        ),
      ),
    );
  }
}

// Skill card
// Skill Card
class _SkillCard extends StatefulWidget {
  final String title;
  final List<String> skills;
  final double width;

  const _SkillCard({
    required this.title,
    required this.skills,
    required this.width,
  });

  @override
  State<_SkillCard> createState() => __SkillCardState();
}

class __SkillCardState extends State<_SkillCard>
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

    switch (category) {
      case 'Languages':
        icon = Icons.code;
        color = Colors.blue.shade600;
        break;
      case 'Frameworks':
        icon = Icons.layers;
        color = Colors.green.shade600;
        break;
      case 'Databases':
        icon = Icons.storage;
        color = Colors.purple.shade600;
        break;
      case 'Tools':
        icon = Icons.build;
        color = Colors.orange.shade600;
        break;
      case 'Specializations':
        icon = Icons.star;
        color = Colors.pink.shade600;
        break;
      default:
        icon = Icons.computer;
        color = Colors.grey.shade600;
    }

    return Icon(icon, color: color, size: 24);
  }
}

// Project card
class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final double width;
  const _ProjectCard({required this.project, required this.width});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
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
                  color: Colors.black.withValues(alpha: _hover ? 0.18 : 0.08),
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

// Filter pill styled like your screenshot
class _FilterPill extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onPressed;
  const _FilterPill({
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  State<_FilterPill> createState() => _FilterPillState();
}

class _FilterPillState extends State<_FilterPill> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.isActive;
    final bg = active
        ? Colors.black87
        : Colors.grey.shade100; // light gray background for inactive
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
                      color: Colors.black.withValues(
                        alpha: active ? 0.28 : 0.08,
                      ),
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

// Cert & Contact cards
class _CertCard extends StatelessWidget {
  final String title;
  final double width;
  const _CertCard({required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
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
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final double width;
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.width,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
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
                color: Colors.black.withValues(alpha: _hover ? 0.12 : 0.06),
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

// ------------- Floating bottom navigation -------------

class NavItem {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  NavItem(this.label, this.icon, this.onTap);
}

class _FloatingNavBar extends StatelessWidget {
  final List<NavItem> items;
  final int activeIndex;

  const _FloatingNavBar({required this.items, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final showLabels = w >= 480; // icons-only below 480px
    final maxBarWidth = w.clamp(280.0, 900.0);

    return Container(
      constraints: BoxConstraints(maxWidth: maxBarWidth),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      // scroll horizontally when content is wider than bar (prevents overflow)
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

// Scroll to top FAB
class _ScrollToTopButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isWhite;

  const _ScrollToTopButton({required this.onTap, this.isWhite = false});

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
