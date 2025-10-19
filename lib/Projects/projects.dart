import 'package:flutter/material.dart';
import '../shared/shared.dart';

class ProjectsSection extends StatefulWidget {
  final bool visible;
  const ProjectsSection({super.key, required this.visible});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String activeTab = 'all';

  List<Map<String, dynamic>> get _filtered {
    if (activeTab == 'all') return AppData.projects;
    return AppData.projects.where((p) => p['category'] == activeTab).toList();
  }

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
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 12,
              children: [
                FilterPill(
                  label: 'All Projects',
                  isActive: activeTab == 'all',
                  onPressed: () => setState(() => activeTab = 'all'),
                ),
                FilterPill(
                  label: 'Application Development',
                  isActive: activeTab == 'application',
                  onPressed: () => setState(() => activeTab = 'application'),
                ),
                FilterPill(
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
                children: _filtered
                    .map(
                      (p) => ProjectCard(
                        project: p,
                        width: projectWidth(cons.maxWidth),
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
}
