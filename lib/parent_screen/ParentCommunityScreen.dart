import 'package:flutter/material.dart';

class ParentCommunityScreen extends StatelessWidget {
  // Sample upcoming events and forum posts data
  final List<Map<String, String>> upcomingEvents = [
    {'event': 'Parent-Teacher Meeting', 'date': 'Nov 28, 2024'},
    {'event': 'Winter Carnival', 'date': 'Dec 15, 2024'},
    {'event': 'Science Fair', 'date': 'Jan 20, 2025'},
    // Add more events
  ];

  final List<Map<String, String>> forumPosts = [
    {'title': 'Discussion on School Uniforms', 'author': 'Ms. Jane Doe', 'date': 'Nov 12, 2024'},
    {'title': 'Parenting Tips for Middle Schoolers', 'author': 'Mr. John Smith', 'date': 'Nov 10, 2024'},
    {'title': 'Upcoming School Events', 'author': 'Mrs. Emily Brown', 'date': 'Nov 5, 2024'},
    // Add more posts
  ];

  ParentCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Community'),
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
                'Welcome to the Parent Community',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 20),

              // Upcoming Events Section
              const Text(
                'Upcoming Events',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _upcomingEventsSection(),

              const SizedBox(height: 30),

              // Forum Posts Section
              const Text(
                'Community Forum',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _forumPostsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Upcoming Events Section
  Widget _upcomingEventsSection() {
    return Column(
      children: upcomingEvents
          .map(
            (event) => Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  event['event']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Date: ${event['date']}',
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Implement event registration or details logic
                  },
                  child: const Text('Register'),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  // Forum Posts Section
  Widget _forumPostsSection() {
    return Column(
      children: forumPosts
          .map(
            (post) => Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  post['title']!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Posted by: ${post['author']} on ${post['date']}',
                  style: const TextStyle(fontSize: 16),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    // Implement navigation to forum post details
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
