// ignore: file_names
import 'package:flutter/material.dart';

class AnimatedFeatureCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;

  const AnimatedFeatureCard({super.key, required this.title, required this.icon, required this.color});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedFeatureCardState createState() => _AnimatedFeatureCardState();
}

class _AnimatedFeatureCardState extends State<AnimatedFeatureCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle navigation
      },
      onTapDown: (_) => setState(() => isHovered = true),
      onTapUp: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: widget.color.withOpacity(isHovered ? 0.8 : 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: isHovered
              ? [BoxShadow(color: widget.color, blurRadius: 15, spreadRadius: 1)]
              : [const BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
