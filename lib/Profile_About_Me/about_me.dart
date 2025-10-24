import 'package:flutter/material.dart';
import '../shared/shared.dart';

// CLEAN IMPROVED VERSION - No extra cards, no CTA box
class AboutSection extends StatelessWidget {
  final bool visible;
  const AboutSection({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Appear(
      isVisible: visible,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: pad(context)),
        // Subtle gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade50, Colors.white],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                // Icon + Title
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // Container(
                //     //   padding: const EdgeInsets.all(12),
                //     //   decoration: BoxDecoration(
                //     //     color: Colors.blue.shade50,
                //     //     borderRadius: BorderRadius.circular(12),
                //     //   ),
                //     //   child: Icon(
                //     //     Icons.person,
                //     //     size: 28,
                //     //     color: Colors.blue.shade700,
                //     //   ),
                //     // ),
                //     // const SizedBox(width: 16),
                //   ],
                // ),
                // const SizedBox(height: 12),
                // Text(
                //   'Get to know me better',
                //   style: TextStyle(
                //     fontSize: 18,
                //     color: Colors.grey.shade600,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                const Text(
                  'Get to Know Me Better',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 36),

                // Enhanced card with better styling
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  padding: EdgeInsets.all(isMobile ? 24 : 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue.shade100, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.08),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Paragraphs with decorative accent
                      ...AppData.aboutMe.asMap().entries.map((entry) {
                        final index = entry.key;
                        final paragraph = entry.value;
                        final isLast = index == AppData.aboutMe.length - 1;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Decorative line for first paragraph
                            if (index == 0)
                              Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                height: 3,
                                width: 60,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade600,
                                      Colors.indigo.shade600,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),

                            // Paragraph text
                            Text(
                              paragraph,
                              style: TextStyle(
                                fontSize: isMobile ? 15 : 16,
                                height: 1.7,
                                color: Colors.black87,
                                fontWeight: isLast
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                letterSpacing: 0.3,
                              ),
                            ),
                            if (!isLast) SizedBox(height: isMobile ? 16 : 20),
                          ],
                        );
                      }),
                    ],
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
