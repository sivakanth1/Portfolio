import 'package:flutter/material.dart';
import '../shared/shared.dart';

class EducationSection extends StatelessWidget {
  final bool visible;
  const EducationSection({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

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
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                const Text(
                  'My Education',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                // const SizedBox(height: 12),
                // Text(
                //   'Academic Background',
                //   style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                // ),
                const SizedBox(height: 36),

                // Grid layout
                isMobile
                    ? Column(
                        children: AppData.education
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: EducationCard(education: e),
                              ),
                            )
                            .toList(),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AppData.education.asMap().entries.map((
                          entry,
                        ) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: entry.key < AppData.education.length - 1
                                    ? 20
                                    : 0,
                              ),
                              child: EducationCard(education: entry.value),
                            ),
                          );
                        }).toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
