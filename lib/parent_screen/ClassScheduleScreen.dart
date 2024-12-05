import 'package:flutter/material.dart';

class ClassScheduleScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> scheduleData = {
    'Monday': [
      {'time': '9:00 AM - 10:30 AM', 'activity': 'Math Class', 'type': 'Class', 'status': 'Present'},
      {'time': '11:00 AM - 12:30 PM', 'activity': 'History Class', 'type': 'Class', 'status': 'Absent'},
      {'time': '3:00 PM - 4:30 PM', 'activity': 'Football Practice', 'type': 'Extracurricular', 'status': 'Present'},
    ],
    'Tuesday': [
      {'time': '9:00 AM - 10:30 AM', 'activity': 'Science Class', 'type': 'Class', 'status': 'Present'},
      {'time': '11:00 AM - 12:30 PM', 'activity': 'Art Class', 'type': 'Class', 'status': 'Present'},
      {'time': '4:00 PM - 5:30 PM', 'activity': 'Music Club', 'type': 'Extracurricular', 'status': 'Absent'},
    ],
    // Other days follow a similar structure...
  };

  ClassScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentDay = _getDayOfWeek(now.weekday);
    String currentTime = '${now.hour}:${now.minute < 10 ? '0' : ''}${now.minute}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student\'s Class Schedule'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Weekly Timetable',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),

            // Current Time
            Text(
              'Current Time: $currentTime',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20),

            // Weekly Schedule Grid
            Expanded(
              child: _weeklyCalendar(currentDay),
            ),

            const SizedBox(height: 20),

            // Upcoming Activities
            _upcomingActivitiesSection(),
          ],
        ),
      ),
    );
  }

  // Weekly Calendar Grid
  Widget _weeklyCalendar(String currentDay) {
    return GridView.builder(
      itemCount: scheduleData.keys.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        String day = scheduleData.keys.elementAt(index);
        List<Map<String, String>> activities = scheduleData[day]!;

        return Card(
          color: day == currentDay ? Colors.blueAccent[100] : Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: day == currentDay ? Colors.blueAccent : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    children: activities.map((activity) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          activity['activity']!,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text('${activity['time']}'),
                        trailing: _attendanceStatusIndicator(activity['status']!),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Attendance Status Indicator
  Widget _attendanceStatusIndicator(String status) {
    Color statusColor;
    String statusText;

    switch (status) {
      case 'Present':
        statusColor = Colors.green;
        statusText = 'Present';
        break;
      case 'Absent':
        statusColor = Colors.red;
        statusText = 'Absent';
        break;
      case 'Late':
        statusColor = Colors.orange;
        statusText = 'Late';
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        statusText,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper: Get Day of Week
  String _getDayOfWeek(int weekday) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return days[weekday - 1];
  }

  // Upcoming Activities Section
  Widget _upcomingActivitiesSection() {
    // Sample upcoming events (You can fetch this dynamically)
    final upcomingEvents = [
      'Parent-Teacher Meeting - Nov 28',
      'Winter Carnival - Dec 15',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming Activities',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        for (var event in upcomingEvents)
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.event, color: Colors.green),
              title: Text(
                event,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Registration logic
                },
                child: const Text('Register'),
              ),
            ),
          ),
      ],
    );
  }
}
