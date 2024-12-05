import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // This will hold the future of roles that we will fetch from Firestore
  late Future<List<Map<String, dynamic>>> _rolesFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the future to fetch roles when the widget is first created
    _rolesFuture = _fetchRoles();
  }

  Future<List<Map<String, dynamic>>> _fetchRoles() async {
  try {
    final snapshot = await _firestore.collection('roles').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return {
        'name': data['name'] ?? 'Unknown Role',
        'iconCode': data['iconCode'] ?? '0xe84e', // Default to "error" icon
        'colorCode': data['colorCode'] ?? 'FF8888', // Default greyish color
        'screen': data['screen'] ?? '/', // Default to a fallback route
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
          // Content
          Center(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              // The future that fetches the roles
              future: _rolesFuture,
              builder: (context, snapshot) {
                // If the data is still loading
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } 
                // If there's an error while fetching roles
                else if (snapshot.hasError) {
                  return Text('Error loading roles: ${snapshot.error}');
                } 
                // If no data is found or if the list is empty
                else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No roles found');
                } 
                // If the data is successfully loaded
                else {
                  final roles = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to EduCare',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // Loop through the roles and create a button for each one
                      ...roles.map((role) => _roleButton(
                            context,
                            role['name'],
                            _getIcon(role['iconCode']),
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

  // A function that returns the UI for each role as a button
  Widget _roleButton(
  BuildContext context,
  String? role,
  Icon? icon,
  Color? color,
  String? targetScreen,
) {
  // Ensure values have sensible defaults if they are null
  final displayRole = role ?? 'Unknown Role';
  final displayIcon = icon ?? const Icon(Icons.error);
  final displayColor = color ?? Colors.grey;
  final displayScreen = targetScreen ?? '/';

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: displayColor,
        shadowColor: Colors.black54,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {
        Navigator.pushNamed(context, displayScreen);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          displayIcon,
          const SizedBox(width: 10),
          Text(
            displayRole,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}


  // Convert icon string (e.g., "Icons.school") into an IconData
  Icon _getIcon(String iconCode) {
    try {
      return Icon(IconData(
        int.parse(iconCode),
        fontFamily: 'MaterialIcons',
      ));
    } catch (e) {
      debugPrint("Error parsing icon: $e");
      return const Icon(Icons.error);
    }
  }

  // Convert hex color string (e.g., "#FF5733") into a Color object
  Color _getColor(String colorCode) {
    try {
      // Parse the hex code and return the Color object
      return Color(int.parse(colorCode, radix: 16)).withOpacity(1.0);
    } catch (e) {
      debugPrint("Error parsing color: $e");
      return Colors.grey; // Default color if parsing fails
    }
  }
}
