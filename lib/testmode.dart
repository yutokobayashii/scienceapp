import 'package:flutter/material.dart';
import 'answerWidget.dart';
import 'questions.dart';
import 'dart:math';
import 'dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class testmode extends StatefulWidget {
  testmode(this.name);
  String name;

  @override
  State<testmode> createState() => _testmodeState();
}

class _testmodeState extends State<testmode> {

  int questionNumber = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}/テストモード'),
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),

        centerTitle: true,
        // actions: [
        //   IconButton(icon: Icon(Icons.search), onPressed: () {}),
        // ],
        elevation: 1,
        flexibleSpace: Image.network(// <-- ここで指定します。
          'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
          fit: BoxFit.cover,
        ),
        toolbarHeight: 100,// <-- ここで高さを指定してあげるとまた雰囲気が変わります
        backgroundColor: Colors.transparent,
      ),
      body: Center(
       child: quizView(),
      ),
    );
  }
}

class quizView extends StatefulWidget {


  @override
  State<quizView> createState() => quizViewState();
}

class quizViewState extends State<quizView> {


  List<Widget> scorekeeper = [];
  List<Widget> truescorekeeper = [];

  saveData() async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
     pref.setInt("score", truescorekeeper.length);
    });
  }


  void ontapped(String text,String text1) {


    if (questionNumber < 9){
  setState(() {
    questionNumber++;
  });
} else {
  print('stop test');
  showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialogSample();
      });
      saveData();
      print(truescorekeeper.length.toString());
}

    if (text == text1) {
      print('正解');

      setState(() {
        scorekeeper.add(
          SizedBox(
              width: 25,
              child: Icon(Icons.panorama_fish_eye,
                color: Colors.red,
              )
          ),
        );
        
        truescorekeeper.add(SizedBox(
            width: 25,
            child: Icon(Icons.panorama_fish_eye,
              color: Colors.red,
            )
        ),
        );
        
      });


    } else {
      print('不正解');
      setState(() {
        scorekeeper.add(
          SizedBox(
              width: 25,
              child: Icon(Icons.close,
                color: Colors.green,
              )),);
      });

    }



  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Q1'),
          Text(questionBank[questionNumber].questionText
          ),
          SizedBox(
            height: 50,
          ),



          GestureDetector(
              child: answerWidget(answerBank[questionNumber].Answer4
              ),
            onTap: () {
              ontapped(answerBank[questionNumber].Answer4,questionBank[questionNumber].questionAnswer);
            },
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
              child: answerWidget(answerBank[questionNumber].Answer1
              ),
            onTap: () {
              ontapped(answerBank[questionNumber].Answer1,questionBank[questionNumber].questionAnswer);
            },
          ),
          SizedBox(
            height: 15,
          ),
         GestureDetector(
              child: answerWidget(answerBank[questionNumber].Answer2
              ),
           onTap: () {
             ontapped(answerBank[questionNumber].Answer2,questionBank[questionNumber].questionAnswer);
           },
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
              child: answerWidget(answerBank[questionNumber].Answer3
              ),
            onTap: () {
              ontapped(answerBank[questionNumber].Answer3,questionBank[questionNumber].questionAnswer);
            },
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            children: scorekeeper
          ),

        ],


      ),

    );

  }
}


