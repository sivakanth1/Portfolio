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

  // NEW: Helper method for circular navigation
  void _goToNextPage() {
    final totalPages = AppData.showcaseProjects.length;
    final nextIndex =
        (currentIndex + 1) % totalPages; // Circular: wraps to 0 after last

    controller.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  // NEW: Helper method for circular navigation
  void _goToPreviousPage() {
    final totalPages = AppData.showcaseProjects.length;
    final prevIndex =
        (currentIndex - 1 + totalPages) %
        totalPages; // Circular: wraps to last from 0

    controller.animateToPage(
      prevIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

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
              // Previous button (desktop only)
              if (desktop)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ArrowButton(
                      icon: Icons.chevron_left,
                      onTap:
                          _goToPreviousPage, // CHANGED: Use circular navigation
                    ),
                  ),
                )
              else
                const SizedBox(width: 2),

              // Page indicators
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

              // Next button (desktop only)
              if (desktop)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ArrowButton(
                      icon: Icons.chevron_right,
                      onTap: _goToNextPage, // CHANGED: Use circular navigation
                    ),
                  ),
                )
              else
                const SizedBox(width: 2),
            ],
          ),
        ],
      ),
    );
  }
}
