import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String role;

  const HomeScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$role Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Hello, $role!',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _getRoleSpecificWidgets(context, role),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This function will return widgets based on the user role.
  List<Widget> _getRoleSpecificWidgets(BuildContext context, String role) {
    switch (role) {
      case 'Student':
        return [
          _customCard(context, 'Your Progress', Icons.bar_chart, Colors.blue),
          _customCard(context, 'Take a Quiz', Icons.quiz, Colors.orange),
        ];
      case 'Parent':
        return [
          _customCard(context, 'View Performance', Icons.insights, Colors.red),
          _customCard(context, 'Contact Teacher', Icons.contact_phone, Colors.blue),
        ];
      case 'Teacher':
        return [
          _customCard(context, 'Grade Assignments', Icons.assignment, Colors.orange),
          _customCard(context, 'Post Announcements', Icons.announcement, Colors.purple),
        ];
      default:
        return [
          _customCard(context, 'Feature Coming Soon', Icons.star, Colors.grey),
        ];
    }
  }

  Widget _customCard(BuildContext context, String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Replace with actual navigation logic to the relevant screen
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
