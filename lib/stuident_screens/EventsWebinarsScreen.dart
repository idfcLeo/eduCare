import 'package:flutter/material.dart';

class EventsWebinarsScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'title': 'AI for Beginners Webinar',
      'date': 'Dec 1, 2024',
      'description': 'A beginner-friendly introduction to AI.',
    },
    {
      'title': 'Career Development Webinar',
      'date': 'Dec 5, 2024',
      'description': 'Tips and strategies for career growth in tech.',
    },
    {
      'title': 'Flutter Development Workshop',
      'date': 'Dec 10, 2024',
      'description': 'Hands-on workshop for building apps with Flutter.',
    },
    // Add more events here
  ];

   EventsWebinarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events & Webinars'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming Events & Webinars',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // ListView for displaying events
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return _EventCard(event: events[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EventCard extends StatefulWidget {
  final Map<String, String> event;

  const _EventCard({required this.event});

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<_EventCard> {
  // For hover effect and animation
  double _elevation = 4.0;
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _elevation = 8.0;
          _scale = 1.05;
        });
      },
      onExit: (_) {
        setState(() {
          _elevation = 4.0;
          _scale = 1.0;
        });
      },
      child: GestureDetector(
        onTap: () {
          // You can add a navigation or action on tap here
          print("Event clicked: ${widget.event['title']}");
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: _elevation,
              ),
            ],
          ),
          transform: Matrix4.identity()..scale(_scale),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.event['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.event['date']!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.event['description']!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
