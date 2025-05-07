import 'package:flutter/material.dart';
import 'posture_analysis_pages/ai_posture_analysis.dart';
import 'posture_analysis_pages/connect_trainer.dart';

class PostureAnalysisScreen extends StatelessWidget {
  const PostureAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posture Analysis')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'This screen will use your camera to analyze posture in real-time.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // AI Posture Analysis Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.asset(
                    'assets/Posture_Ai.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Check Posture via AI',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Use your camera to analyze your posture in real-time using AI.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AIPostureDetector(),
                              ),
                            );
                          },
                          child: const Text('Start Analysis'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Connect with Trainer Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.asset(
                    'assets/trainer.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Connect with Trainer',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Get professional feedback and guidance by connecting with a trainer.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const ConnectTrainerPage(),
                              ),
                            );
                          },
                          child: const Text('Connect Now'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
