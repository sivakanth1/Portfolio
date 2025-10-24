import 'package:flutter/material.dart';
import '../shared/shared.dart';

class PublicationSection extends StatelessWidget {
  final bool visible;
  const PublicationSection({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Appear(
      isVisible: visible,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: pad(context)),
        color: Colors.white,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
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
                  (pub) => Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                      left: isMobile ? 0 : 100,
                      right: isMobile ? 0 : 100,
                    ),
                    child: PublicationCard(publication: pub),
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
