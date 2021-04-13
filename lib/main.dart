import 'package:flutter/material.dart';
import 'package:my_app/UI/button.dart';
import 'package:my_app/question/answer.dart';
import 'package:my_app/question/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var currentIndex = 0;
  var questions = [
    {
      "text": "Whats your favorite color?",
      "options": ['Blue', 'Green', 'Black'],
      "selected": null
    },
    {
      "text": "Whats your favorite animal?",
      "options": ['Lion', 'Tiger', 'Snake'],
      "selected": null
    },
    {
      "text": "Whats your favorite Language?",
      "options": ['Javascript', 'C', 'Python'],
      "selected": null
    }
  ];

  void answerPressed(option) {
    print(option);
    setState(() {
      questions[currentIndex]['selected'] = option;
    });
  }

  void previous() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex = currentIndex - 1;
      }
    });
  }

  void next() {
    setState(() {
      currentIndex = (currentIndex + 1) % questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Question(questions[currentIndex]['text']),
                  ...(questions[currentIndex]['options'] as List<String>)
                      .map((option) {
                    return Answer(option, answerPressed,
                        questions[currentIndex]['selected']);
                  }).toList()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    onPressed: currentIndex == 0 ? null : previous,
                    child: Row(
                      children: [
                        Icon(Icons.chevron_left_sharp),
                        Text('Previous')
                      ],
                    ),
                  ),
                  Button(
                    onPressed:
                        currentIndex == questions.length - 1 ? null : next,
                    child: Row(
                      children: [Text('Next'), Icon(Icons.chevron_right_sharp)],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
