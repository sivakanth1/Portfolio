import 'package:flutter/material.dart';
import 'package:portfolio/shared/shared.dart';

class CertificationSection extends StatelessWidget {
  final bool visible;
  const CertificationSection({super.key, required this.visible});

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
              'Certifications & Achievements',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Professional credentials and accomplishments',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 36),
            LayoutBuilder(
              builder: (_, cons) => Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: AppData.certifications
                    .map(
                      (c) =>
                          CertCard(title: c, width: certWidth(cons.maxWidth)),
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
