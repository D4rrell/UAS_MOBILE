import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  final String question;
  final String correctAnswer;
  final List<String> options;
  String? selectedOption;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json["question"],
      correctAnswer: json["correctAnswer"],
      options: List<String>.from(json["options"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "question": question,
        "correctAnswer": correctAnswer,
        "options": List<String>.from(options),
      };
}
