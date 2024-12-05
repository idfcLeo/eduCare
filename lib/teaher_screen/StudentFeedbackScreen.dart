import 'package:flutter/material.dart';

class StudentFeedbackScreen extends StatelessWidget {
  // Sample data for feedback
  final List<Map<String, String>> feedbackList = [
    {
      'student': 'John Doe',
      'rating': '4.5',
      'comment': 'Great teaching style! Very engaging and informative.',
      'avatar': 'assets/john_doe.png'
    },
    {
      'student': 'Jane Smith',
      'rating': '5.0',
      'comment': 'Clear explanations and practical examples.',
      'avatar': 'assets/jane_smith.png'
    },
    {
      'student': 'Alice Johnson',
      'rating': '3.8',
      'comment': 'Good, but could provide more visual aids.',
      'avatar': 'assets/alice_johnson.png'
    },
    {
      'student': 'Mark Brown',
      'rating': '4.2',
      'comment': 'Very thorough and well-structured lessons.',
      'avatar': 'assets/mark_brown.png'
    },
    {
      'student': 'Sophia Lee',
      'rating': '4.7',
      'comment': 'Extremely helpful and supportive in class.',
      'avatar': 'assets/sophia_lee.png'
    },
    {
      'student': 'James White',
      'rating': '3.9',
      'comment': 'Interesting content, but more examples would be helpful.',
      'avatar': 'assets/james_white.png'
    },
    // More feedback data can be added here
  ];

  StudentFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Feedback'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Feedback Given by Students',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  return _FeedbackCard(feedback: feedbackList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  final Map<String, String> feedback;

  const _FeedbackCard({required this.feedback});

  @override
  Widget build(BuildContext context) {
    double rating = double.parse(feedback['rating']!);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Avatar and Student Info
            CircleAvatar(
              backgroundImage: AssetImage(feedback['avatar']!),
              radius: 30,
            ),
            const SizedBox(width: 16),
            // Feedback details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Student Name
                  Text(
                    feedback['student']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Rating with stars
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < rating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Comment
                  Text(
                    feedback['comment']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
