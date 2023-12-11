import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mobel_geming/model/data_question.dart';

class FetchingAPI {
  Future<List<Question>> fetchVocab() async {
    final String apiUrl =
        "https://mobilegeming-f7110-default-rtdb.asia-southeast1.firebasedatabase.app/vocabulary.json";
    Response response = await http.get(Uri.parse(apiUrl));
    List<Question> vocab;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      vocab = jsonData.values.map((value) {
        return Question.fromJson(value);
      }).toList();
      return vocab;
    } else {
      throw Exception('Failed to load data places');
    }
  }

  Future<List<Question>> fetchGrammar() async {
    final String apiUrl =
        "https://mobilegeming-f7110-default-rtdb.asia-southeast1.firebasedatabase.app/grammar.json";
    Response response = await http.get(Uri.parse(apiUrl));
    List<Question> grammar;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      grammar = jsonData.values.map((value) {
        return Question.fromJson(value);
      }).toList();

      return grammar;
    } else {
      throw Exception('Failed to load data places');
    }
  }

  Future<List<Question>> fetchReading() async {
    final String apiUrl =
        "https://mobilegeming-f7110-default-rtdb.asia-southeast1.firebasedatabase.app/reading.json";
    Response response = await http.get(Uri.parse(apiUrl));
    List<Question> reading;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      reading = jsonData.values.map((value) {
        return Question.fromJson(value);
      }).toList();

      return reading;
    } else {
      throw Exception('Failed to load data places');
    }
  }

  Future<List<Question>> fetchStructure() async {
    final String apiUrl =
        "https://mobilegeming-f7110-default-rtdb.asia-southeast1.firebasedatabase.app/structure.json";
    Response response = await http.get(Uri.parse(apiUrl));
    List<Question> structure;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      structure = jsonData.values.map((value) {
        return Question.fromJson(value);
      }).toList();

      return structure;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}
