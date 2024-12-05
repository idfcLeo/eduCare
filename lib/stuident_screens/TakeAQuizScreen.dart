import 'package:flutter/material.dart';

class TakeAQuizScreen extends StatefulWidget {
  const TakeAQuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TakeAQuizScreenState createState() => _TakeAQuizScreenState();
}

class _TakeAQuizScreenState extends State<TakeAQuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<int> _pastScores = []; // Store past scores

  // Example set of questions and answers
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Berlin', 'Madrid', 'Paris', 'Rome'],
      'answer': 'Paris',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      'answer': 'Mars',
    },
    {
      'question': 'What is the largest ocean on Earth?',
      'options': ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
      'answer': 'Pacific',
    },
  ];

  void _nextQuestion(String selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex]['answer']) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Quiz finished
        _saveScore();
        _showResultDialog();
      }
    });
  }

  void _saveScore() {
    _pastScores.add(_score); // Save the current score to past scores list
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Completed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          content: Text('Your score: $_score/${_questions.length}', style: const TextStyle(fontSize: 18)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                });
              },
              child: const Text('Retry', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Go back to previous screen
              },
              child: const Text('Finish', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Self-assessment form
  void _showSelfAssessment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Self Assessment', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('How do you feel about your performance?', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Write your thoughts here...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Submit', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Light blue background for a calm feel
      appBar: AppBar(
        title: const Text('Take a Quiz', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with the current question index
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
              style: const TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Display the current question
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Show options in custom-styled buttons
            ..._questions[_currentQuestionIndex]['options']
                .map<Widget>((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _nextQuestion(option),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.blueAccent,
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(option, style: const TextStyle(fontSize: 18)),
                ),
              );
            }).toList(),
            const Spacer(),
            // Display current score
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Score: $_score/${_questions.length}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            // Card-style sections for past scores and self-assessment
            Card(
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.history, color: Colors.blue),
                title: const Text('View Past Scores', style: TextStyle(fontSize: 18)),
                onTap: () {
                  _showPastScores();
                },
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.self_improvement, color: Colors.orange),
                title: const Text('Self Assessment', style: TextStyle(fontSize: 18)),
                onTap: () {
                  _showSelfAssessment();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show past scores
  void _showPastScores() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Past Scores', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          content: _pastScores.isEmpty
              ? const Text('No past scores available.', style: TextStyle(fontSize: 16))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _pastScores
                      .map<Widget>((score) => Text('Score: $score/${_questions.length}', style: const TextStyle(fontSize: 16)))
                      .toList(),
                ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}
