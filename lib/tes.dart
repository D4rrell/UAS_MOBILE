// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: QuizScreen(),
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//     );
//   }
// }

// class QuizScreen extends StatefulWidget {
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int _currentIndex = 0;
//   int _score = 0;

//   List<Map<String, dynamic>> questions = [
//     {
//       'question': "Josh: hi, my name is Joshua. But you can call me Josh.\n\n"
//           "Karin: hai Josh. Nice to meet you. I’m Karin. By the way, where are you come from.\n\n"
//           "Josh: I………….. Bali but I will stay in Jakarta for a while to study. Do you know about Bali?\n\n"
//           "Karin: No. so can you tell me a little bout Bali? I never once visited Bali.\n\n"
//           "Josh: sure. You will like it because Bali is so wonderful place.\n\n"
//           "Karin: I'm excited to hear that!",
//       'options': ['Jakarta', 'Surabaya', 'Bandung', 'Yogyakarta'],
//       'correctAnswer': 'Jakarta',
//     },
//     {
//       'question': 'Berapa jumlah provinsi di Indonesia?',
//       'options': ['26', '27', '28', '34'],
//       'correctAnswer': '34',
//     },
//     // Add more questions as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quiz App'),
//       ),
//       body: _currentIndex < questions.length
//           ? SingleChildScrollView(
//               child: Column(
//                 children: [
//                   QuizCard(
//                     question: questions[_currentIndex]['question'],
//                     options: questions[_currentIndex]['options'],
//                     onAnswerSelected: (String selectedOption) {
//                       if (selectedOption ==
//                           questions[_currentIndex]['correctAnswer']) {
//                         setState(() {
//                           _score++;
//                         });
//                       }
//                       // Perbarui opsi yang dipilih
//                       setState(() {
//                         questions[_currentIndex]['selectedOption'] =
//                             selectedOption;
//                       });
//                     },
//                     selectedOption: questions[_currentIndex]
//                         ['selectedOption'], // Tambahkan baris ini
//                   ),
//                   SizedBox(height: 16.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           // Pindah ke pertanyaan sebelumnya jika tidak berada di pertanyaan pertama
//                           if (_currentIndex > 0) {
//                             setState(() {
//                               _currentIndex--;
//                             });
//                           }
//                         },
//                         child: Text('Previous'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Pindah ke pertanyaan berikutnya
//                           setState(() {
//                             _currentIndex++;
//                           });

//                           // Jika semua soal sudah dijawab, tampilkan nilai total
//                           if (_currentIndex == questions.length) {
//                             _showResultDialog();
//                           }
//                         },
//                         child: Text('Next'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           : Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Quiz Selesai!',
//                     style: TextStyle(
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _currentIndex = 0;
//                         _score = 0;
//                         for (var question in questions) {
//                           question['selectedOption'] = null;
//                         }
//                       });
//                     },
//                     child: Text('Mulai Ulang Quiz'),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   void _showResultDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Hasil Quiz'),
//           content: Text('Skor Anda: $_score dari ${questions.length}'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Tutup'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class QuizCard extends StatelessWidget {
//   final String question;
//   final List<String> options;
//   final Function(String) onAnswerSelected;
//   final String? selectedOption; // Tambahkan baris ini

//   QuizCard({
//     required this.question,
//     required this.options,
//     required this.onAnswerSelected,
//     required this.selectedOption, // Tambahkan baris ini
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16.0),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               question,
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16.0),
//             Column(
//               children: options
//                   .map(
//                     (option) => RadioListTile<String>(
//                       title: Text(option),
//                       groupValue: selectedOption, // Perbarui baris ini
//                       value: option,
//                       onChanged: (String? value) {
//                         onAnswerSelected(value!);
//                       },
//                     ),
//                   )
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
