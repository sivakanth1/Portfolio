import 'package:flutter/material.dart';
import '../shared/shared.dart';

class ExperienceSection extends StatelessWidget {
  final bool visible;
  const ExperienceSection({super.key, required this.visible});

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
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Column(
              children: [
                const Text(
                  'My Professional Journey',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                // const SizedBox(height: 12),
                // Text(
                //   'My professional journey',
                //   style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                // ),
                const SizedBox(height: 36),

                // Grid layout
                isMobile
                    ? Column(
                        children: AppData.experience
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ExperienceCard(experience: e),
                              ),
                            )
                            .toList(),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AppData.experience.asMap().entries.map((
                          entry,
                        ) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: entry.key < AppData.experience.length - 1
                                    ? 20
                                    : 0,
                              ),
                              child: ExperienceCard(experience: entry.value),
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

// import 'package:flutter/material.dart';
// import '../shared/shared.dart';
//
// class ExperienceSection extends StatelessWidget {
//   final bool visible;
//   const ExperienceSection({super.key, required this.visible});
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isMobile = width < 900;
//
//     return Appear(
//       isVisible: visible,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 80, horizontal: pad(context)),
//         color: Colors.white,
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 1400),
//             child: Column(
//               children: [
//                 const Text(
//                   'My Professional Journey',
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 36),
//
//                 // Grid layout: 2 cards in first row, 1 card in second row
//                 isMobile
//                     ? Column(
//                   children: AppData.experience
//                       .map(
//                         (e) => Padding(
//                       padding: const EdgeInsets.only(bottom: 20),
//                       child: ExperienceCard(experience: e),
//                     ),
//                   )
//                       .toList(),
//                 )
//                     : Column(
//                   children: [
//                     // First row: 2 cards
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: ExperienceCard(
//                             experience: AppData.experience[0],
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: ExperienceCard(
//                             experience: AppData.experience[1],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     // Second row: 1 card (centered, half width)
//                     Row(
//                       children: [
//                         const Expanded(child: SizedBox()), // Left spacer
//                         Expanded(
//                           flex: 2,
//                           child: ExperienceCard(
//                             experience: AppData.experience[2],
//                           ),
//                         ),
//                         const Expanded(child: SizedBox()), // Right spacer
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
