import 'package:flutter/material.dart';

class EngagementAnalyticsScreen extends StatelessWidget {
  final int totalStudents = 50;
  final int activeStudents = 38;
  final double engagementRate = 0.76; // Active students / Total students
  final List<Map<String, String>> upcomingEvents = [
    {'eventName': 'Science Fair', 'enrolled': '25'},
    {'eventName': 'Sports Meet', 'enrolled': '40'},
    {'eventName': 'Coding Workshop', 'enrolled': '30'},
  ];
  final List<Map<String, dynamic>> studentEngagement = [
    {'name': 'John Doe', 'engagement': 85},
    {'name': 'Jane Smith', 'engagement': 92},
    {'name': 'Alice Johnson', 'engagement': 78},
    {'name': 'Mark Brown', 'engagement': 60},
  ];

  EngagementAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Engagement Analytics'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Class Engagement Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),

              // Class Engagement Metrics
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _metricCard('Total Students', totalStudents.toString()),
                  _metricCard('Active Students', activeStudents.toString()),
                  _metricCard(
                    'Engagement Rate',
                    '${(engagementRate * 100).toStringAsFixed(1)}%',
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Infographic: Engagement Rate Progress
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Overall Engagement Rate',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: engagementRate,
                            strokeWidth: 12,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.blueAccent,
                            ),
                          ),
                          Center(
                            child: Text(
                              '${(engagementRate * 100).toStringAsFixed(1)}%',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Upcoming Events
              const Text(
                'Upcoming Events & Enrollments',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _eventSection(),
              const SizedBox(height: 30),

              // Student Engagement Section
              const Text(
                'Student Engagement Levels',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _studentEngagementSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Metric Card Widget
  Widget _metricCard(String title, String value) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  // Event Section Widget
  Widget _eventSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: upcomingEvents.length,
      itemBuilder: (context, index) {
        final event = upcomingEvents[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(
              event['eventName']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              '${event['enrolled']} students enrolled',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            leading: const Icon(Icons.event, color: Colors.blueAccent, size: 30),
          ),
        );
      },
    );
  }

  // Student Engagement Section Widget
  Widget _studentEngagementSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: studentEngagement.length,
      itemBuilder: (context, index) {
        final student = studentEngagement[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(
              student['name'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Engagement: ${student['engagement']}%',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            trailing: Icon(
              Icons.check_circle,
              color: student['engagement'] > 75 ? Colors.green : Colors.red,
            ),
          ),
        );
      },
    );
  }
}
