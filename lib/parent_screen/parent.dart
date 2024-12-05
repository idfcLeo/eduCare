import 'package:flutter/material.dart';
import 'package:educare/parent_screen/ViewPerformanceScreen.dart';
import 'package:educare/parent_screen/ContactTeacherScreen.dart';
import 'package:educare/parent_screen/AttendanceInsightsScreen.dart';
import 'package:educare/parent_screen/FeedbackScreen.dart';
import 'package:educare/parent_screen/ClassScheduleScreen.dart';
import 'package:educare/parent_screen/ParentCommunityScreen.dart';
import 'package:educare/parent_screen/AINotificationsScreen.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _customCard(context, 'View Performance', Icons.insights, Colors.red, const ViewPerformanceScreen()),
            _customCard(context, 'Contact Teacher', Icons.contact_phone, Colors.blue, ContactTeacherScreen()),
            _customCard(context, 'Attendance Insights', Icons.check_circle, Colors.teal, AttendanceInsightsScreen()),
            _customCard(context, 'Feedback', Icons.feedback, Colors.amber, const FeedbackScreen()),
            _customCard(context, 'Class Schedule', Icons.schedule, Colors.green, ClassScheduleScreen()),
            _customCard(context, 'Parent Community', Icons.groups, Colors.pink, ParentCommunityScreen()),
            _customCard(context, 'AI Notifications', Icons.notifications, Colors.purple, const AINotificationsScreen()),
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
