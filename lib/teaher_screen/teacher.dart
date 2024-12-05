import 'package:flutter/material.dart';
import 'package:educare/teaher_screen/GradeAssignmentsScreen.dart';
import 'package:educare/teaher_screen/EngagementAnalyticsScreen.dart';
import 'package:educare/teaher_screen/PostAnnouncementsScreen.dart';
import 'package:educare/teaher_screen/InteractiveLessonsScreen.dart';
import 'package:educare/teaher_screen/ManageTimetablescreen.dart';
import 'package:educare/teaher_screen/StudentFeedbackScreen.dart';
import 'package:educare/teaher_screen/AIAlertsInsightsScreen.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _customCard(context, 'Grade Assignments', Icons.assignment, Colors.orange, const GradeAssignmentsScreen()),
            _customCard(context, 'Engagement Analytics', Icons.analytics, Colors.green, EngagementAnalyticsScreen()),
            _customCard(context, 'Post Announcements', Icons.announcement, Colors.purple, const PostAnnouncementsScreen()),
            _customCard(context, 'Interactive Lessons', Icons.school, Colors.blue, const InteractiveLessonsScreen()),
            _customCard(context, 'Manage Timetable', Icons.calendar_today, Colors.redAccent, const ManageTimetableScreen()),
            _customCard(context, 'Student Feedback', Icons.feedback, Colors.indigo, StudentFeedbackScreen()),
            _customCard(context, 'AI Alerts & Insights', Icons.warning, Colors.cyan, const AIAlertsInsightsScreen()),
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
