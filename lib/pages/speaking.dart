import 'package:flutter/material.dart';
import 'package:mobel_geming/model/data_question.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final List<Question> questions;

  QuizScreen({
    required this.title,
    required this.questions,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _currentIndex < widget.questions.length
          ? SingleChildScrollView(
              child: Column(
                children: [
                  QuizCard(
                    question: widget.questions[_currentIndex].question,
                    options: List<String>.from(
                        widget.questions[_currentIndex].options),
                    onAnswerSelected: (String selectedOption) {
                      if (selectedOption ==
                          widget.questions[_currentIndex].correctAnswer) {
                        setState(() {
                          _score++;
                        });
                      }
                      // Perbarui opsi yang dipilih
                      setState(() {
                        widget.questions[_currentIndex].selectedOption =
                            selectedOption;
                      });
                    },
                    selectedOption: widget.questions[_currentIndex].selectedOption,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Pindah ke pertanyaan sebelumnya jika tidak berada di pertanyaan pertama
                          if (_currentIndex > 0) {
                            setState(() {
                              _currentIndex--;
                            });
                          }
                        },
                        child: Text('Previous'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Pindah ke pertanyaan berikutnya
                          setState(() {
                            _currentIndex++;
                          });

                          // Jika semua soal sudah dijawab, tampilkan nilai total
                          if (_currentIndex == widget.questions.length) {
                            _showResultDialog();
                          }
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz Selesai!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                        _score = 0;
                        for (var question in widget.questions) {
                          question.selectedOption = null;
                        }
                      });
                    },
                    child: Text('Mulai Ulang Quiz'),
                  ),
                ],
              ),
            ),
    );
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil Quiz'),
          content:
              Text('Benar Anda: $_score dari ${widget.questions.length} soal'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

class QuizCard extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(String) onAnswerSelected;
  final String? selectedOption; // Tambahkan baris ini

  QuizCard({
    required this.question,
    required this.options,
    required this.onAnswerSelected,
    required this.selectedOption, // Tambahkan baris ini
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Column(
              children: options
                  .map(
                    (option) => RadioListTile<String>(
                      title: Text(option),
                      groupValue: selectedOption, // Perbarui baris ini
                      value: option,
                      onChanged: (String? value) {
                        onAnswerSelected(value!);
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
