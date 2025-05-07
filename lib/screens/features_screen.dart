import 'package:flutter/material.dart';
import 'feature_pages/personalized_goals.dart';
import 'feature_pages/posture_analysis.dart';
import 'feature_pages/track_workout.dart';
import 'feature_pages/bmr_screen.dart';

class FeaturesScreen extends StatelessWidget {
  final List<_Feature> features = [
    _Feature(
      icon: Icons.flag,
      title: 'Personalized Goals',
      description: 'Set and manage your health goals.',
      screen: PersonalizedGoalsScreen(),
    ),
    _Feature(
      icon: Icons.accessibility_new,
      title: 'Posture Analysis',
      description: 'AI-powered posture correction system.',
      screen: PostureAnalysisScreen(),
    ),
    _Feature(
      icon: Icons.fitness_center,
      title: 'Track Workout',
      description: 'Log and analyze your workouts.',
      screen: TrackWorkoutScreen(),
    ),
    _Feature(
      icon: Icons.monitor_weight,
      title: 'BMR Calculator',
      description: 'Calculate your Basal Metabolic Rate.',
      screen: BMRScreen(),
    ),
  ];

  FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Features')),
      body: ListView.builder(
        itemCount: features.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final feature = features[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Icon(feature.icon, size: 32, color: Colors.blue),
              title: Text(feature.title),
              subtitle: Text(feature.description),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => feature.screen),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _Feature {
  final IconData icon;
  final String title;
  final String description;
  final Widget screen;

  _Feature({
    required this.icon,
    required this.title,
    required this.description,
    required this.screen,
  });
}
