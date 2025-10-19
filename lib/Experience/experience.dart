import 'package:flutter/material.dart';
import '../shared/shared.dart';

class ExperienceSection extends StatelessWidget {
  final bool visible;
  const ExperienceSection({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return Appear(
      isVisible: visible,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: pad(context)),
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              'Work Experience',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'My professional journey',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 36),
            ...AppData.experience.map((e) => ExperienceCard(experience: e)),
          ],
        ),
      ),
    );
  }
}
