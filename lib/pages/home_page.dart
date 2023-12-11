import 'package:flutter/material.dart';
import 'package:mobel_geming/fetching/fetching_api.dart';
import 'package:mobel_geming/model/data_question.dart';
import 'package:mobel_geming/util/emoticon_face.dart';
import 'package:mobel_geming/util/exercise_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FetchingAPI fetching = FetchingAPI();
  bool isBadTapped = false;
  bool isFineTapped = false;
  bool isWellTapped = false;
  bool isExcellentTapped = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Column(
                children: [
                  //greetings row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Hi Darrel!
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Darrel!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '28 Sep, 2023',
                            style: TextStyle(color: Colors.blue[200]),
                          ),
                        ],
                      ),

                      // Notiffication
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // search bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //How do you feel?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // Emoticon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //bad
                      InkWell(
                        onTap: () {
                          setState(() {
                            isBadTapped = !isBadTapped;
                            isFineTapped = false;
                            isWellTapped = false;
                            isExcellentTapped = false;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: isBadTapped
                                    ? Border.all(
                                        color: Colors.white, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: EmoticonFace(
                                emoticonFace: '😩',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Bad',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),

//fine
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFineTapped = !isFineTapped;
                            isBadTapped = false;
                            isWellTapped = false;
                            isExcellentTapped = false;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: isFineTapped
                                    ? Border.all(
                                        color: Colors.white, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: EmoticonFace(
                                emoticonFace: '🙂',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Fine',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),

//well
                      InkWell(
                        onTap: () {
                          setState(() {
                            isWellTapped = !isWellTapped;
                            isBadTapped = false;
                            isFineTapped = false;
                            isExcellentTapped = false;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: isWellTapped
                                    ? Border.all(
                                        color: Colors.white, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: EmoticonFace(
                                emoticonFace: '😊',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Well',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),

//excellent
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExcellentTapped = !isExcellentTapped;
                            isBadTapped = false;
                            isFineTapped = false;
                            isWellTapped = false;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: isExcellentTapped
                                    ? Border.all(
                                        color: Colors.white, width: 2.0)
                                    : null,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: EmoticonFace(
                                emoticonFace: '😃',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Excellent',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.grey[100],
                child: Center(
                  child: Column(
                    children: [
                      // Heading Exercises
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Exercises',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // listview dari exercise
                      Expanded(
                        child: ListView(
                          children: [
                            FutureBuilder(
                              future: fetching.fetchVocab(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
