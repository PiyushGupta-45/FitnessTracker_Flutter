import 'package:flutter/material.dart';

class TrackWorkoutScreen extends StatelessWidget {
  const TrackWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Track Workout')),
      body: Center(
        child: Text(
          'Track your workouts here. Add exercise, reps, sets, and time.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
