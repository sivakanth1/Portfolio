import 'package:flutter/material.dart';
import '../shared/shared.dart';

class EducationSection extends StatelessWidget {
  final bool visible;
  const EducationSection({super.key, required this.visible});

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
              'Education',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Academic Background',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 36),
            ...AppData.education.map((e) => EducationCard(education: e)),
          ],
        ),
      ),
    );
  }
}
