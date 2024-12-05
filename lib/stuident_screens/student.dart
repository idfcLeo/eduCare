import 'package:flutter/material.dart';
import 'package:educare/stuident_screens/your_progress.dart';
import 'package:educare/stuident_screens/TakeAQuizScreen.dart';
import 'package:educare/stuident_screens/LearningResources.dart';
import 'package:educare/stuident_screens/DiscussionForumScreen.dart';
import 'package:educare/stuident_screens/EventsWebinarsScreen.dart';
import 'package:educare/stuident_screens/CareerGuidanceScreen.dart';
import 'package:educare/stuident_screens/AIAlertsScreen.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _customCard(context, 'Your Progress', Icons.bar_chart, Colors.blue, const YourProgressScreen()),
            _customCard(context, 'Take a Quiz', Icons.quiz, Colors.orange, const TakeAQuizScreen()),
            _customCard(context, 'Learning Resources', Icons.book, Colors.green, LearningResourcesScreen()),
            _customCard(context, 'Discussion Forum', Icons.chat, Colors.purple, DiscussionForumScreen()),
            _customCard(context, 'Events & Webinars', Icons.event, Colors.cyan, EventsWebinarsScreen()),
            _customCard(context, 'Career Guidance', Icons.work, Colors.brown, CareerGuidanceScreen()),
            _customCard(context, 'AI Alerts', Icons.warning_amber, Colors.red, const AIAlertsScreen()),
          ],
        ),
      ),
    );
  }

  Widget _customCard(BuildContext context, String title, IconData icon, Color color, Widget destinationPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Card(
        elevation: 5,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              radius: 30,
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
