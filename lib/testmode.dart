import 'package:flutter/material.dart';
import 'answerWidget.dart';
import 'questions.dart';
import 'dart:math';
import 'dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'firebasequestion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class testmode extends StatefulWidget {
  testmode(this.name);
  String name;





  @override
  State<testmode> createState() => _testmodeState();
}

class _testmodeState extends State<testmode> {






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

// quizView(this.user);
//
// final User user;

  @override
  State<quizView> createState() => quizViewState();
}

class quizViewState extends State<quizView> {



  void firebaselogic() async{
//ここのロジックを別ファイルに分けたいなー
//widgetをfor文でループ処理に切り替える必要がある。






    final SN = await FirebaseFirestore.instance.collection('単元').get();


    final int subjectNumber = SN.docs.length;

    print('subjectNumber===${subjectNumber}');

    for (int a = 1; a<=subjectNumber; a++) {

      final  QN = await FirebaseFirestore.instance.collection(
          '単元').doc('単元${a}').collection('問題').get();
      final int questionNumberForRecord = QN.docs.length;
      //問題の数を記録

      print('questionNumberForRecord===${questionNumberForRecord}');
      final subject = await FirebaseFirestore.instance.collection(
          '単元').doc('単元${a}').get();
      //単元の変数をクラウドにある分だけ作成。
       setState(() {

      subjectList.add(subject['単元${a}']);
      SLN = subjectList.length;
        });

      print('subjectList===${subjectList}');

      for (int b = 1; b<=questionNumberForRecord; b++) {
        //答えの数を記録
        final AN = await FirebaseFirestore.instance.collection(
            '単元').doc('単元${a}').collection('問題').doc('問題${b}').collection('答え').get();
        final int answerNumber = AN.docs.length;

        print('answerNumber===${answerNumber}');
        //問題の変数をクラウドにある分だけ作成。
        final question = await FirebaseFirestore.instance.collection(
            '単元').doc('単元${a}').collection('問題').doc('問題${b}').get();


          setState(() {
        print('questionnumber===${questionNumber}');
        questionList.add(question['問題${b}']);
        correctAnswerList.add(question['正解${b}']);
        QLN = questionList.length;
        presentQuestion = questionList[questionNumber];//questionNumber = 1を代入している。

        print('presentQuestion---${presentQuestion}');

           });
          print('QLN===${QLN}');
        print('questionList===${questionList}');
        print('correctAnswerList===${correctAnswerList}');
        for (int c = 1; c<=answerNumber; c++) {
          //答えの変数をクラウドにある分だけ作成。
          final answer = await FirebaseFirestore.instance.collection(
              '単元').doc('単元${a}').collection('問題').doc('問題${b}').collection('答え').doc('答え${c}').get();

            setState(() {

          answerList.add(answer['答え${c}']);
          ALN = answerList.length;

               });
        }

        presentAnswer1 = answerList[0];
        presentAnswer2 = answerList[1];
         presentAnswer3 = answerList[2];
         presentAnswer4 = answerList[3];
        print('answerList===${answerList}');
        print('presentAnswer1${presentAnswer1}');
        print('presentAnswer2${presentAnswer2}');
        print('presentAnswer3${presentAnswer3}');
        print('presentAnswer4${presentAnswer4}');




      }//問題for

    }//単元for


  }

  @override
  void initState() {
    super.initState();


    firebaselogic();
//呼び出す場所が悪い。アプリを起動したタイミングで呼び出しても良いのでは？
  }

   List<Widget> scorekeeper = [];
  List<Widget> truescorekeeper = [];

  saveData() async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
     pref.setInt("score", truescorekeeper.length);
    });
  }


  void ontapped(String text,String text1) {
//タップした際の挙動。
//オンタップ時に不具合あり。
    if (questionNumber < QLN -1){
  setState(() {
    questionNumber++;
  presentQuestion = questionList[questionNumber];//二回目以降の代入ロジックを担当。
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
      height: 370,//350
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text('Q'+titleNumber.toString()),


          Text(presentQuestion ?? '読み込み中。。。'
          ),
          SizedBox(
            height: 50,
          ),



          GestureDetector(
              child: answerWidget(presentAnswer1 ?? '読み込み中。。。'
              ),
            onTap: () {
              ontapped(presentAnswer1,correctAnswerList[questionNumber]);
            },
          ),
          SizedBox(
            height: 15,
          ),


          GestureDetector(
              child:answerWidget( presentAnswer2 ?? '読み込み中。。。'),
            onTap: () {
              ontapped(presentAnswer2,correctAnswerList[questionNumber]);
            },
         ),


          SizedBox(
            height: 15,
          ),
         GestureDetector(
              child: answerWidget(presentAnswer3 ?? '読み込み中。。。'
              ),
           onTap: () {
             ontapped(presentAnswer3,correctAnswerList[questionNumber]);
           },
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
              child: answerWidget(presentAnswer4 ?? '読み込み中。。。'
              ),
            onTap: () {
              ontapped(presentAnswer4,correctAnswerList[questionNumber]);
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


