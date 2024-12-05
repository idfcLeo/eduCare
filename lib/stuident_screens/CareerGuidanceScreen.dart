import 'package:flutter/material.dart';

class CareerGuidanceScreen extends StatelessWidget {
  final List<Map<String, String>> careerPaths = [
    {
      'title': 'Software Development',
      'description': 'Build apps and software systems.',
      'progress': '50%',
    },
    {
      'title': 'Data Science',
      'description': 'Work with data to generate insights.',
      'progress': '30%',
    },
    {
      'title': 'UX/UI Design',
      'description': 'Design intuitive and beautiful user interfaces.',
      'progress': '75%',
    },
  ];

  CareerGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Guidance'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Career Paths',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            // Career Paths List
            Expanded(
              child: ListView.builder(
                itemCount: careerPaths.length,
                itemBuilder: (context, index) {
                  var career = careerPaths[index];
                  return CareerCard(career: career);
                },
              ),
            ),
            const SizedBox(height: 30),
            // Career Quiz Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to quiz or assessment screen
                  print('Navigating to career quiz');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 2,
                ),
                child: const Text(
                  'Take Career Assessment',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CareerCard extends StatelessWidget {
  final Map<String, String> career;
  const CareerCard({super.key, required this.career});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            // Career Title
            Text(
              career['title']!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            // Career Description
            Text(
              career['description']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 12),
            // Progress Indicator (minimal style)
            LinearProgressIndicator(
              value: double.parse(career['progress']!.replaceAll('%', '')) / 100,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blueAccent,
              minHeight: 5,
            ),
            const SizedBox(height: 8),
            Text(
              'Progress: ${career['progress']}',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
