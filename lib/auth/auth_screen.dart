import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  final String role;

  const AuthScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$role Authentication'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$role Login',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            _textField('Email'),
            const SizedBox(height: 20),
            _textField('Password', obscureText: true),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle navigation to signup page
              },
              child: const Text(
                'Don’t have an account? Signup here',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
