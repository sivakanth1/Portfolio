import 'package:flutter/material.dart';
import '../shared/shared.dart';

class SkillsSection extends StatelessWidget {
  final bool visible;
  const SkillsSection({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return Appear(
      isVisible: visible,
      child: Container(
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
                children: AppData.skills.entries
                    .map(
                      (e) => SkillCard(
                        title: e.key,
                        skills: e.value,
                        width: skillWidth(cons.maxWidth),
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
