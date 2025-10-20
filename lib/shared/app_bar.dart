import 'package:flutter/material.dart';
import 'package:portfolio/shared/shared.dart';

Widget customAppBar() {
  return SliverAppBar(
    floating: true,
    pinned: true,
    elevation: 0,
    backgroundColor: Colors.white.withOpacity(0.98),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade50.withOpacity(0.3)],
        ),
        border: Border(
          bottom: BorderSide(color: Colors.blue.shade100, width: 1.5),
        ),
      ),
    ),
    title: LayoutBuilder(
      builder: (context, constraints) {
        final width = MediaQuery.of(context).size.width;

        // Mobile: Show only initials and shorter title
        if (width < 500) {
          return Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade600, Colors.indigo.shade600],
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade200,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'SK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Siva Kanth',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'App & Software Dev',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        // Tablet and Desktop: Full name and title
        return Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade600, Colors.indigo.shade600],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'SK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Siva Kanth Reddy',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Application & Software Developer',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
    actions: [
      // Responsive icon sizing
      LayoutBuilder(
        builder: (context, constraints) {
          final width = MediaQuery.of(context).size.width;
          final iconSize = width < 500 ? 32.0 : 40.0;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SocialIcon(
                asset: 'assets/githublogo.png',
                url: 'https://github.com/sivakanth1',
                size: iconSize,
                fallbackIcon: Icons.code,
              ),
              SizedBox(width: width < 500 ? 4 : 8),
              _SocialIcon(
                asset: 'assets/Linkedinlogo.png',
                url: 'https://www.linkedin.com/in/sivakanth1',
                size: iconSize,
                fallbackIcon: Icons.business,
              ),
              SizedBox(width: width < 500 ? 4 : 8),
              _SocialIcon(
                asset: 'assets/gmaillogo.png',
                url: 'mailto:k.l.sivakanthreddy01@gmail.com',
                size: iconSize,
                fallbackIcon: Icons.email,
              ),
              const SizedBox(width: 8),
            ],
          );
        },
      ),
    ],
  );
}

// Helper widget for social icons
class _SocialIcon extends StatelessWidget {
  final String asset;
  final String url;
  final double size;
  final IconData fallbackIcon;

  const _SocialIcon({
    required this.asset,
    required this.url,
    required this.size,
    required this.fallbackIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (asset.contains("github")) {
      return GestureDetector(
        onTap: () => launchURL(url),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.black,
          ),
          child: Image.asset(
            asset,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Icon(
              fallbackIcon,
              size: size * 0.6,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () => launchURL(url),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Image.asset(
          asset,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) =>
              Icon(fallbackIcon, size: size * 0.6, color: Colors.grey.shade700),
        ),
      ),
    );
  }
}
