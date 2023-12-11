import 'package:flutter/material.dart';
import 'package:mobel_geming/fetching/fetching_api.dart';
import 'package:mobel_geming/model/data_question.dart';
import 'package:mobel_geming/util/exercise_tile.dart';

class TaskPage extends StatelessWidget {
  final FetchingAPI fetching = new FetchingAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: ListView(
        children: [
          // Daftar tugas
          FutureBuilder(
            future: fetching.fetchVocab(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Question> vocab = snapshot.data;
                return ExerciseTile(
                  icon: Icons.favorite,
                  exerciseName: 'Vocabulary',
                  data: vocab,
                  color: Colors.red,
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder(
            future: fetching.fetchGrammar(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Question> grammar = snapshot.data;
                return ExerciseTile(
                  icon: Icons.person,
                  exerciseName: 'Grammar',
                  data: grammar,
                  color: Colors.grey,
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder(
            future: fetching.fetchReading(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Question> reading = snapshot.data;
                return ExerciseTile(
                  icon: Icons.star,
                  exerciseName: 'Reading Comprehension',
                  data: reading,
                  color: Colors.yellow,
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder(
            future: fetching.fetchStructure(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Question> structure = snapshot.data;
                return ExerciseTile(
                  icon: Icons.earbuds,
                  exerciseName: 'Sentence Structure',
                  data: structure,
                  color: Color.fromARGB(255, 8, 183, 63),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
