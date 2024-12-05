import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class AIAlertsScreen extends StatefulWidget {
  const AIAlertsScreen({super.key});

  @override
  _AIAlertsScreenState createState() => _AIAlertsScreenState();
}

class _AIAlertsScreenState extends State<AIAlertsScreen> {
  List<String> _alerts = [];

  @override
  void initState() {
    super.initState();
    _loadAlerts();
  }

  // Load alerts from shared preferences
  Future<void> _loadAlerts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _alerts = prefs.getStringList('aiAlerts') ?? [];
    });
  }

  // Save a new alert to shared preferences
  Future<void> _saveAlert(String alert) async {
    final prefs = await SharedPreferences.getInstance();
    _alerts.add(alert);
    await prefs.setStringList('aiAlerts', _alerts);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Alerts'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Past Notifications',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Display the list of alerts
            Expanded(
              child: ListView.builder(
                itemCount: _alerts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _alerts[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Button to simulate receiving a new AI alert
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Simulating a new AI alert
                  String newAlert = 'New AI alert at ${DateTime.now().toString()}';
                  _saveAlert(newAlert);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 2,
                ),
                child: const Text(
                  'Simulate AI Alert',
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

class SharedPreferences {
  static getInstance() {}
}
