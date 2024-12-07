import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late Future<List<Map<String, dynamic>>> _rolesFuture;

  @override
  void initState() {
    super.initState();
    _rolesFuture = _fetchRoles();
  }

  // Fetch roles from Firestore
  Future<List<Map<String, dynamic>>> _fetchRoles() async {
    try {
      final snapshot = await _firestore.collection('roles' ).get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        debugPrint(
            'Fetched role: ${doc.id}, Screen: ${data['screen']}, Color: ${data['colorCode']}');
        return {
          'name': doc.id, // Role name from document ID
          'colorCode': data['colorCode'] ?? 'FF8888', // Default color
          'screen': data['screen'] ?? '/', // Default to home route
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching roles: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _rolesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error loading roles: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No roles found');
                } else {
                  final roles = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to EduCare',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      ...roles.map((role) => _roleButton(
                            context,
                            role['name'],
                            _getColor(role['colorCode']),
                            role['screen'],
                          )),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Button for each role
  Widget _roleButton(
    BuildContext context,
    String? role,
    Color? color,
    String? targetScreen,
  ) {
    final displayRole = role ?? 'Unknown Role';
    final displayColor = color ?? Colors.grey;
    final displayScreen = targetScreen ?? '/';

    debugPrint('Button for $displayRole navigates to $displayScreen');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: displayColor,
            shadowColor: Colors.black54,
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {
            if (displayScreen.isNotEmpty) {
              Navigator.pushNamed(context, displayScreen);
            } else {
              debugPrint('Invalid or empty route for $role.');
            }
          },
          child: Text(
            displayRole,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // Convert Firestore color codes to Flutter Color objects
  Color _getColor(String colorCode) {
    try {
      return Color(int.parse('0xFF$colorCode'));
    } catch (e) {
      debugPrint("Error parsing color: $e");
      return Colors.grey; // Default color
    }
  }
}
