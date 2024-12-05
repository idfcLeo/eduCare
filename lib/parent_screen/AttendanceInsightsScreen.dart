import 'package:flutter/material.dart';

class AttendanceInsightsScreen extends StatelessWidget {
  final Map<String, dynamic> attendanceData = {
    'overall': 0.86,
    'classes': 0.92,
    'events': 0.75,
    'extracurricular': 0.80,
    'detailed': [
      {'type': 'Math Class', 'attendance': 0.95},
      {'type': 'History Class', 'attendance': 0.90},
      {'type': 'Science Fair', 'attendance': 0.70},
      {'type': 'Football Practice', 'attendance': 0.85},
      {'type': 'Art Club', 'attendance': 0.78},
    ],
  };

  AttendanceInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Insights'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Attendance Insights',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),

              // Overall Attendance
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Overall Attendance',
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
                            value: attendanceData['overall'],
                            strokeWidth: 12,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.blueAccent,
                            ),
                          ),
                          Center(
                            child: Text(
                              '${(attendanceData['overall'] * 100).toStringAsFixed(1)}%',
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

              // Attendance Categories
              _attendanceCategory('Class Attendance', attendanceData['classes']),
              const SizedBox(height: 10),
              _attendanceCategory('Event Attendance', attendanceData['events']),
              const SizedBox(height: 10),
              _attendanceCategory(
                  'Extracurricular Activities Attendance', attendanceData['extracurricular']),
              const SizedBox(height: 30),

              // Detailed Attendance
              const Text(
                'Detailed Attendance',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _detailedAttendanceSection(attendanceData['detailed']),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Attendance Categories
  Widget _attendanceCategory(String title, double percentage) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              '${(percentage * 100).toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }

  // Detailed Attendance Section
  Widget _detailedAttendanceSection(List<dynamic> detailedData) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: detailedData.length,
      itemBuilder: (context, index) {
        final activity = detailedData[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(
              activity['type'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            trailing: Text(
              '${(activity['attendance'] * 100).toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
        );
      },
    );
  }
}
