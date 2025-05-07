import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About FitTrack',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'FitTrack is a smart fitness tracker app built to help users stay active and healthy. '
              'It combines goal setting, workout tracking, posture analysis, and data visualization '
              'in one intuitive platform.',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 30),
            Text('Version 1.0.0', style: TextStyle(color: Colors.grey[600])),
            Text(
              '© 2025 FitTrack Inc.',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
