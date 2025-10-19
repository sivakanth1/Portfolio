import 'package:flutter/material.dart';
import '../shared/shared.dart';

class ProjectShowcase extends StatelessWidget {
  final PageController controller;
  final int currentIndex;
  final ValueChanged<int> onChanged;
  const ProjectShowcase({
    super.key,
    required this.controller,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final desktop = MediaQuery.of(context).size.width >= 1024;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: pad(context)),
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
            'Project Showcase',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Interactive project highlights',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 36),
          SizedBox(
            height: isMobile ? 600 : 450,
            child: PageView.builder(
              controller: controller,
              onPageChanged: onChanged,
              itemCount: AppData.showcaseProjects.length,
              itemBuilder: (_, i) => ShowcaseCard(
                project: AppData.showcaseProjects[i],
                isMobile: isMobile,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              desktop
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ArrowButton(
                          icon: Icons.chevron_left,
                          onTap: () => controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(width: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  AppData.showcaseProjects.length,
                  (i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == i ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == i
                          ? Colors.blue.shade600
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              desktop
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ArrowButton(
                          icon: Icons.chevron_right,
                          onTap: () => controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(width: 2),
            ],
          ),

          // desktop-only manual arrows (kept, no layout change)
          // if (desktop) ...[
          //   Positioned(
          //     left: 8,
          //     top: 0,
          //     bottom: 0,
          //     child: Center(
          //       child: ArrowButton(
          //         icon: Icons.chevron_left,
          //         onTap: () => controller.previousPage(
          //           duration: const Duration(milliseconds: 500),
          //           curve: Curves.easeOut,
          //         ),
          //       ),
          //     ),
          //   ),
          //   Positioned(
          //     right: 8,
          //     top: 0,
          //     bottom: 0,
          //     child: Center(
          //       child: ArrowButton(
          //         icon: Icons.chevron_right,
          //         onTap: () => controller.nextPage(
          //           duration: const Duration(milliseconds: 500),
          //           curve: Curves.easeOut,
          //         ),
          //       ),
          //     ),
          //   ),
          // ],
        ],
      ),
    );
  }
}
