import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to FitTrack!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Your personal fitness companion to help you stay on track with your health goals.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            Text(
              'Quick Overview:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.flag, color: Colors.blue),
              title: Text('Set Personalized Goals'),
              subtitle: Text('Define and track your daily or weekly goals.'),
            ),
            ListTile(
              leading: Icon(Icons.accessibility_new, color: Colors.green),
              title: Text('Analyze Your Posture'),
              subtitle: Text('Real-time posture feedback using your camera.'),
            ),
            ListTile(
              leading: Icon(Icons.fitness_center, color: Colors.orange),
              title: Text('Track Your Workouts'),
              subtitle: Text('Log and review your workout sessions.'),
            ),
          ],
        ),
      ),
    );
  }
}
