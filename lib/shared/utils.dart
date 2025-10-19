import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double pad(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  if (w < 600) return 20;
  if (w < 1024) return 36;
  return 48;
}

double skillWidth(double maxWidth) {
  if (maxWidth < 600) return maxWidth - 40;
  if (maxWidth < 1024) return (maxWidth - 60) / 2;
  return 350;
}

double projectWidth(double maxWidth) {
  if (maxWidth < 600) return maxWidth - 40;
  if (maxWidth < 1024) return maxWidth - 60;
  return 500;
}

double certWidth(double maxWidth) {
  if (maxWidth < 600) return maxWidth - 40;
  if (maxWidth < 1024) return maxWidth - 60;
  return 400;
}

double contactWidth(double maxWidth) {
  if (maxWidth < 600) return maxWidth - 40;
  if (maxWidth < 1024) return (maxWidth - 60) / 2;
  return 280;
}

void launchURL(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    SnackBar(content: Text('Could not launch $url'));
  }
}
