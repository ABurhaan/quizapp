import 'package:flutter/material.dart';
import 'package:quizapp/answers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> questions = [
    'somaaliya xornimada wali maqaadanin',
    'wiilka abdullahi ladhaho wa shidanyahay',
    'madaxwaynaheenu waa farmaajo',
    'flutter wa eber',
    'aniga iyo adiga wa isku yaacaynaa'
  ];
  List<bool> answers = [false, true, false, false, true];
  int qindex = 0;
  int cans = 0;
  int fans = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff081015),
      body: Column(children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              questions[qindex],
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: 65,
                      margin: EdgeInsets.only(left: 22, right: 22),
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            final isCorrect = answers[qindex];
                            setState(() {
                              if (qindex < questions.length - 1)
                                qindex++;
                              else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(
                                            answers: cans, falses: fans)));
                              }
                            });
                            if (isCorrect == true) {
                              print('waa sax');
                              setState(() {
                                cans++;
                              });
                            } else {
                              print('waa khalad');
                              fans++;
                            }
                          },
                          child: Text(
                            'True',
                            style: TextStyle(fontSize: 18),
                          ))),
                ),
              ],
            )),
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: 65,
                      margin: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            final isFalse = answers[qindex];
                            setState(() {
                              if (qindex < questions.length - 1)
                                qindex++;
                              else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result(
                                            answers: cans, falses: fans)));
                              }
                            });
                            if (isFalse == false) {
                              print('waa saxday');
                              setState(() {
                                cans++;
                              });
                            } else {
                              print('waad khaladay');
                              fans++;
                            }
                          },
                          child: Text(
                            'False',
                            style: TextStyle(fontSize: 18),
                          ))),
                ),
              ],
            )),
      ]),
    );
  }
}
