import 'package:flutter/material.dart';

class AIAlertsInsightsScreen extends StatelessWidget {
  const AIAlertsInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Progress'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'Your Progress Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
