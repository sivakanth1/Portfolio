import 'package:flutter/material.dart';
import '../shared/shared.dart';

class PublicationSection extends StatelessWidget {
  final bool visible;
  const PublicationSection({super.key, required this.visible});

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
              'Publications',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Research contributions',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 36),
            ...AppData.publications.map(
              (pub) => PublicationCard(publication: pub),
            ),
          ],
        ),
      ),
    );
  }
}
