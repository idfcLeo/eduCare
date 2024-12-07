import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Import screens
import 'RoleSelectionScreen.dart';
import 'auth/parent_auth.dart';
import 'auth/student_auth.dart';
import 'auth/teacher_auth.dart';
import 'stuident_screens/student.dart';
import 'teaher_screen/teacher.dart';
import 'auth/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase
      .initializeApp(); // Ensure Firebase is initialized before app starts
  runApp(const EduConnectApp());
}

class EduConnectApp extends StatelessWidget {
  const EduConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduCare',
      theme: _buildAppTheme(),
      initialRoute: '/',
      routes: _buildRoutes(),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Unknown Route')),
          body: Center(child: Text('Unknown route: ${settings.name}')),
        ),
      ),
    );
  }

  // Define the app's theme
  ThemeData _buildAppTheme() {
    return ThemeData(
      primaryColor: Colors.blueAccent,
      hintColor: Colors.amber,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blueAccent, // Primary button color
        textTheme: ButtonTextTheme.primary, // Text color on buttons
      ),
    );
  }

  // Define the app's routes
  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      '/': (context) => const RoleSelectionScreen(),
      '/parentAuth': (context) => const ParentAuth(),
      '/studentAuth': (context) => const StudentAuth(),
      '/teacherAuth': (context) => const TeacherAuth(),
      '/studentHome': (context) => const StudentHomeScreen(),
      '/teacherHome': (context) => const TeacherHomeScreen(),
      '/authscreen': (context) => const SimpleAuthPage(),
    };
  }
}
