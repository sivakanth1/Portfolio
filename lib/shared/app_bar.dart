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
    title: Row(
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
        Column(
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
            ),
            Text(
              'Application & Software Developer',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () => launchURL('https://github.com/sivakanth1'),
        icon: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
          child: Center(
            child: Image.asset(
              'assets/githublogo.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(child: Icon(Icons.code)),
            ),
          ),
        ),
      ),
      IconButton(
        onPressed: () => launchURL('https://www.linkedin.com/in/sivakanth1'),
        icon: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
          ),
          child: Center(
            child: Image.asset(
              'assets/Linkedinlogo.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(child: Icon(Icons.business)),
            ),
          ),
        ),
      ),
      IconButton(
        onPressed: () => launchURL('mailto:k.l.sivakanthreddy01@gmail.com'),
        icon: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset(
              'assets/gmaillogo.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(child: Icon(Icons.business)),
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
    ],
  );
}
