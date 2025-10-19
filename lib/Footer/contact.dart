import 'package:flutter/material.dart';
import 'package:portfolio/shared/shared.dart';

class ContactSection extends StatefulWidget {
  final bool visible;
  const ContactSection({super.key, required this.visible});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _hoverLinkedin = false;
  bool _hoverGithub = false;
  bool _hoverGmail = false;
  @override
  Widget build(BuildContext context) {
    return Appear(
      isVisible: widget.visible,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: pad(context)),
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
                  SizedBox(
                    width: 175,
                    height: 175,
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _hoverLinkedin = true),
                      onExit: (_) => setState(() => _hoverLinkedin = false),
                      child: GestureDetector(
                        onTap: () =>
                            launchURL('https://www.linkedin.com/in/sivakanth1'),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 160),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _hoverLinkedin
                                  ? Colors.black
                                  : Colors.grey.shade200,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  _hoverLinkedin ? 0.25 : 0.06,
                                ),
                                blurRadius: _hoverLinkedin ? 30 : 12,
                                offset: Offset(0, _hoverLinkedin ? 20 : 6),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/Linkedin.png',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Center(
                              child: ContactCard(
                                icon: Icons.business,
                                title: 'LinkedIn',
                                subtitle: 'Connect with me',
                                onPressed: () => launchURL(
                                  'https://www.linkedin.com/in/sivakanth1',
                                ),
                                width: contactWidth(cons.maxWidth),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 175,
                    height: 175,
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _hoverGithub = true),
                      onExit: (_) => setState(() => _hoverGithub = false),
                      child: GestureDetector(
                        onTap: () => launchURL('https://github.com/sivakanth1'),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 160),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _hoverGithub
                                  ? Colors.red
                                  : Colors.grey.shade200,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: _hoverGithub ? 0.25 : 0.06,
                                ),
                                blurRadius: _hoverGithub ? 30 : 12,
                                offset: Offset(0, _hoverGithub ? 20 : 6),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/Github.png',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Center(
                              child: ContactCard(
                                icon: Icons.code,
                                title: 'GitHub',
                                subtitle: 'View my code',
                                onPressed: () =>
                                    launchURL('https://github.com/sivakanth1'),
                                width: contactWidth(cons.maxWidth),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 175,
                    height: 175,
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _hoverGmail = true),
                      onExit: (_) => setState(() => _hoverGmail = false),
                      child: GestureDetector(
                        onTap: () =>
                            launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 160),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _hoverGmail
                                  ? Colors.black
                                  : Colors.grey.shade200,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: _hoverGmail ? 0.25 : 0.06,
                                ),
                                blurRadius: _hoverGmail ? 30 : 12,
                                offset: Offset(0, _hoverGmail ? 20 : 6),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/Gmail.png',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Center(
                              child: ContactCard(
                                icon: Icons.code,
                                title: 'Email',
                                subtitle: 'Connect with me',
                                onPressed: () => launchURL(
                                  'mailto:k.l.sivakanthreddy01@gmail.com',
                                ),
                                width: contactWidth(cons.maxWidth),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
