import 'package:flutter/material.dart';

class DiscussionForumScreen extends StatelessWidget {
  final List<Map<String, String>> discussions = [
    {
      'title': 'How to implement state management in Flutter?',
      'category': 'Flutter',
      'user': 'John Doe',
      'content': 'Can anyone suggest the best way to implement state management in Flutter?',
      'avatar': 'https://www.example.com/john_doe_avatar.jpg'
    },
    {
      'title': 'Dart Null Safety: A comprehensive guide',
      'category': 'Dart',
      'user': 'Jane Smith',
      'content': 'I need a detailed guide on implementing null safety in Dart. Any suggestions?',
      'avatar': 'https://www.example.com/jane_smith_avatar.jpg'
    },
    {
      'title': 'Best practices for Flutter UI/UX design',
      'category': 'UI/UX',
      'user': 'Sam Wilson',
      'content': 'What are the best practices for designing beautiful and functional Flutter apps?',
      'avatar': 'https://www.example.com/sam_wilson_avatar.jpg'
    },
  ];

  DiscussionForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discussion Forum'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Join the Discussion',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: discussions.length,
                itemBuilder: (context, index) {
                  final discussion = discussions[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(discussion['avatar']!),
                        radius: 25,
                      ),
                      title: Text(
                        discussion['title']!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${discussion['user']} - ${discussion['category']}',
                        style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(Icons.comment, color: Colors.blue),
                        onPressed: () {
                          // Open discussion thread to reply
                          print('Opening thread for ${discussion['title']}');
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new post functionality
          print('Navigating to Add New Post screen');
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
