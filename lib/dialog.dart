import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:science/main.dart';
import 'package:science/questions.dart';
import 'package:science/testLast_page.dart';
import 'firebasequestion.dart';
import 'first_page.dart';
import 'testmode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertDialogSample extends StatefulWidget {
  AlertDialogSample(this.name,this.text,this.correctText);
  String name;
  String text;
  String correctText;
  @override
  State<AlertDialogSample> createState() => _AlertDialogSampleState(name,text,correctText);
}
class _AlertDialogSampleState extends State<AlertDialogSample> {
  //const AlertDialogSample({Key? key}) : super(key: key);
  _AlertDialogSampleState(this.name,this.text,this.correctText);
  String name;
  String text;
  String correctText;
  int userScore = 0;

  getData() async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      userScore = pref.getInt("score") ?? 0;
    });
  }

  @override
  void initState(){
    super.initState();
    getData();
    print('確認');
print(userScore.toString());

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          '今回の点数は${QLN}点満点中${userScore}点です。',
          textAlign: TextAlign.center),
      content: const Text(
          'テストの解説を表示しますか？'
          ,textAlign: TextAlign.center),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70, // background
                  onPrimary: Colors.cyan, // foreground
                ),
              onPressed: () {
                //○だった時の処理を記載
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => testLast_page()),

                );
                var now = DateTime.now();

                var a = FirebaseFirestore.instance.collection('誤回答記録');//.doc(widget.name).collection(presentQuestion).doc(presentQuestion);


                a.add({
                  '項目' :  name,
                  '問題' :  presentQuestion,
                  '実施日時' : '${now.year}/${now.month}/${now.day}/${now.hour}:${now.minute}',
                  '誤回答' : text,
                  '正解' : correctText,
                  '解説' : presentComment,
                  '画像' : getBoolFromImageFlag ? getImageList[questionNumber] :  null,



                });

                questionNumber = 0;
              },
              child: const Text('はい',
             // style: TextStyle(
             //   color: Colors.indigoAccent
             // ),
              )
            ),
            const SizedBox(
              width: 20,
            ),
           ElevatedButton(
               style: ElevatedButton.styleFrom(
                 primary: Colors.white70, // background
                 onPrimary: Colors.cyan, // foreground
               ),
              onPressed: () {
                //×だった時の処理を記載

                var now = DateTime.now();

                var a = FirebaseFirestore.instance.collection('誤回答記録').doc(name);//.doc(widget.name).collection(presentQuestion).doc(presentQuestion);


                a.set({
                  '項目' :  name,
                  '問題' :  presentQuestion,
                  '実施日時' : '${now.year}/${now.month}/${now.day}/${now.hour}:${now.minute}',
                  '誤回答' : text,
                  '正解' : correctText,
                  '解説' : presentComment,
                  '画像' : getBoolFromImageFlag ? getImageList[questionNumber] :  null,



                });


                sLN = 0;
                 QLN = 0;
                 ALN = 0;

                 presentSubject = '';
                 presentQuestion = '';
                 presentComment = '';
                 presentAnswer1 = '読み込み中';
                 presentAnswer2 = '読み込み中';
                 presentAnswer3 = '読み込み中';
                 presentAnswer4 = '読み込み中';

                subjectList = [];
                questionList = [];
                answerList1 = [];
                answerList2 = [];
                answerList3 = [];
                answerList4 = [];
                correctAnswerList = [];
                subjectListForFirstPage = [];
                selectedAnswerList = [];
                commentList = [];
                 getBoolFromImageFlag = false;
                 getBoolFromImageFlagList = [];
                 getImageList = [];
                 titleNumber = 1;
                 questionNumber = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
                questionNumber = 0;
              },
              child: const Text('いいえ',
                // style: TextStyle(
                //     color: Colors.indigoAccent
                // ),
              )
            ),
          ],
        ),
      ],
    );
  }
}

//todo; 点数をこっちに表示できるようにしたい
//todo; 単元によって問題を分けたい