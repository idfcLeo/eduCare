import 'package:flutter/material.dart';

class ContactTeacherScreen extends StatelessWidget {
  // Sample data for teacher contacts
  final List<Map<String, String>> teachers = [
    {'name': 'Mr. John Doe', 'subject': 'Math', 'email': 'johndoe@example.com', 'phone': '123-456-7890'},
    {'name': 'Ms. Jane Smith', 'subject': 'History', 'email': 'janesmith@example.com', 'phone': '098-765-4321'},
    {'name': 'Mr. Robert Brown', 'subject': 'Science', 'email': 'robertbrown@example.com', 'phone': '234-567-8901'},
    {'name': 'Ms. Emily White', 'subject': 'English', 'email': 'emilywhite@example.com', 'phone': '345-678-9012'},
    // Add more teachers as needed
  ];

  ContactTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Teachers'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Teacher Contacts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),

            // Search Field
            _searchField(),

            const SizedBox(height: 20),

            // Teacher List
            Expanded(child: _teacherList()),
          ],
        ),
      ),
    );
  }

  // Search Field for Filtering Teachers
  Widget _searchField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Search for a teacher or subject',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (query) {
        // Implement search functionality
        // Filter teachers list based on query
      },
    );
  }

  // Teacher List
  Widget _teacherList() {
    return ListView.builder(
      itemCount: teachers.length,
      itemBuilder: (context, index) {
        final teacher = teachers[index];

        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(
              teacher['name']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              teacher['subject']!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.contact_phone),
              onPressed: () {
                // Navigate to teacher's contact details
                _showTeacherDetails(context, teacher);
              },
            ),
          ),
        );
      },
    );
  }

  // Show Teacher Details Dialog
  void _showTeacherDetails(BuildContext context, Map<String, String> teacher) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Contact ${teacher['name']}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Subject: ${teacher['subject']}'),
              const SizedBox(height: 10),
              Text('Email: ${teacher['email']}'),
              const SizedBox(height: 10),
              Text('Phone: ${teacher['phone']}'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement email action (launch email app)
                    },
                    child: const Text('Email'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement call action (dial phone)
                    },
                    child: const Text('Call'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
