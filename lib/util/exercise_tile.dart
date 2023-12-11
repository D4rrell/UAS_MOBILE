import 'package:flutter/material.dart';
import 'package:mobel_geming/model/data_question.dart';
import 'package:mobel_geming/pages/speaking.dart'; // Import halaman detail exercise

class ExerciseTile extends StatelessWidget {
  final IconData icon;
  final String exerciseName;
  final List<Question> data;
  final Color color;

  const ExerciseTile({
    Key? key,
    required this.icon,
    required this.exerciseName,
    required this.data,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Tambahkan GestureDetector untuk menangani onTap
      onTap: () {
        // Navigasi ke halaman detail "Speaking Skills"
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(
              title: exerciseName,
              questions : data,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: color,
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exerciseName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data.length} Question',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.more_horiz),
            ],
          ),
        ),
      ),
    );
  }
}
