// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class GradeAssignmentsScreen extends StatefulWidget {
  const GradeAssignmentsScreen({super.key});

  @override
  _GradeAssignmentsScreenState createState() => _GradeAssignmentsScreenState();
}

class _GradeAssignmentsScreenState extends State<GradeAssignmentsScreen> {
  final List<Map<String, String>> studentAssignments = [
    {
      'name': 'John Doe',
      'assignment': 'Math Assignment 1',
      'grade': 'A',
      'remarks': '',
    },
    {
      'name': 'Jane Smith',
      'assignment': 'History Assignment 2',
      'grade': 'B',
      'remarks': '',
    },
    {
      'name': 'Alice Johnson',
      'assignment': 'Science Assignment 1',
      'grade': 'A+',
      'remarks': '',
    },
    {
      'name': 'Mark Brown',
      'assignment': 'English Assignment 3',
      'grade': 'B+',
      'remarks': '',
    },
  ];

  // Grades are converted to numeric values for comparison
  final Map<String, int> gradeValues = {
    'A+': 4,
    'A': 3,
    'B+': 2,
    'B': 1,
    'C': 0,
  };

  @override
  Widget build(BuildContext context) {
    // Calculate highest and lowest grades
    String highestGrade = _getHighestGrade();
    String lowestGrade = _getLowestGrade();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Assignments'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Class Highest and Lowest Grades
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Class Highest Grade',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Text(
                      highestGrade,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Class Lowest Grade',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Text(
                      lowestGrade,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Student Performance Infograph (Progress Bar or Chart)
            const Text(
              'Student Performance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _studentPerformanceInfograph(),
            const SizedBox(height: 20),

            // Assignment List
            const Text(
              'Grade Assignments & Add Remarks',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: studentAssignments.length,
                itemBuilder: (context, index) {
                  return _AssignmentCard(studentAssignments[index], context);
                },
              ),
            ),
            const SizedBox(height: 20),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to save the grades and remarks
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Grades and remarks saved')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  'Submit Grades',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Get the highest grade in the class
  String _getHighestGrade() {
    List<String> grades = studentAssignments.map((student) => student['grade']!).toList();
    grades.sort((a, b) => gradeValues[b]!.compareTo(gradeValues[a]!)); // Sort in descending order
    return grades.first;
  }

  // Get the lowest grade in the class
  String _getLowestGrade() {
    List<String> grades = studentAssignments.map((student) => student['grade']!).toList();
    grades.sort((a, b) => gradeValues[a]!.compareTo(gradeValues[b]!)); // Sort in ascending order
    return grades.first;
  }

  // Create a simple infograph (progress bar) for student performance
  Widget _studentPerformanceInfograph() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: studentAssignments.map((assignment) {
        double performance = _calculatePerformance(assignment['grade']!);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                assignment['name']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: performance,
                backgroundColor: Colors.grey[300],
                color: performance == 1.0 ? Colors.green : Colors.orange,
                minHeight: 8,
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Calculate performance based on grade
  double _calculatePerformance(String grade) {
    switch (grade) {
      case 'A+':
        return 1.0; // Best performance
      case 'A':
        return 0.9;
      case 'B+':
        return 0.75;
      case 'B':
        return 0.5;
      case 'C':
        return 0.3; // Worst performance
      default:
        return 0.0;
    }
  }

  Widget _AssignmentCard(Map<String, String> assignment, BuildContext context) {
    TextEditingController gradeController = TextEditingController(text: assignment['grade']);
    TextEditingController remarksController = TextEditingController(text: assignment['remarks']);

    return InkWell(
      onTap: () {
        _showStudentDetails(context, assignment);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Student Name and Assignment Title
              Text(
                assignment['name']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Assignment: ${assignment['assignment']}',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showStudentDetails(BuildContext context, Map<String, String> assignment) {
    TextEditingController gradeController = TextEditingController(text: assignment['grade']);
    TextEditingController remarksController = TextEditingController(text: assignment['remarks']);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Student Name and Assignment Title
              Text(
                'Student: ${assignment['name']}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Assignment: ${assignment['assignment']}',
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Grade Input Field
              TextField(
                controller: gradeController,
                decoration: const InputDecoration(
                  labelText: 'Grade',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  assignment['grade'] = value; // update the grade value
                },
              ),
              const SizedBox(height: 16),

              // Remarks Input Field
              TextField(
                controller: remarksController,
                decoration: const InputDecoration(
                  labelText: 'Remarks',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                onChanged: (value) {
                  assignment['remarks'] = value; // update the remarks value
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
