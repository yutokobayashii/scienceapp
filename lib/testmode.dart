import 'package:flutter/material.dart';
import 'answerWidget.dart';
import 'main.dart';
import 'questions.dart';
import 'dart:math';
import 'dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'firebasequestion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'first_page.dart';


var titleHolder;


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
         leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {


           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => MyApp()),

           );

           sLN = 0;
           QLN = 0;
           ALN = 0;
           titleNumber = 1;
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
           getBoolFromImageFlagList = [];
           getBoolFromImageFlag = false;
           getImageList = [];
           questionNumber = 0;


         }),

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
       child: quizView(widget.name),
      ),
    );
  }
}

class quizView extends StatefulWidget {
  quizView(this.name);

late String name;

  @override
  State<quizView> createState() => quizViewState(name);
}

class quizViewState extends State<quizView> {
  quizViewState(this.name);
  late String name;

  _getTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 以下の「counter」がキー名。見つからなければ０を返す
    setState(() {
      titleHolder = prefs.getString('title') ?? 'nil error';
    });


    print('titleHolder=====$titleHolder' ?? 'nil');
  }



  void firebaselogic() async{
//ここのロジックを別ファイルに分けたいなー
//widgetをfor文でループ処理に切り替える必要がある。




    //
    final sN = await FirebaseFirestore.instance.collection('項目').get();
    // subjectList.add(sN['項目']);

    final int subjectNumber = sN.docs.length;


    print('subjectNumber===${subjectNumber}');


    for (int i = 1; i <= subjectNumber; i ++) {
      final subject = await FirebaseFirestore.instance.collection(
          '項目').doc('項目$i').get();
      //単元の変数をクラウドにある分だけ作成。
      setState(() {

        subjectList.add(subject['項目']);
        sLN = subjectList.length;
      });

      print('subjectList${subjectList[i-1]}');


      if (titleHolder == subjectList[i-1]) {

        print('success');

        //ここに問題のロジックを書いていけばいいはず。
         final  qN = await FirebaseFirestore.instance.collection(
          '項目').doc('項目$i').collection('問題').get();
         final int questionNumberForRecord = qN.docs.length;


      for (int b = 1; b<=questionNumberForRecord; b++) {
        //答えの数を記録
        final aN = await FirebaseFirestore.instance.collection(
            '項目').doc('項目$i').collection('問'
            '題').doc('問題$b')
            .collection('答え')
            .get();
        final int answerNumber = aN.docs.length;

        print('answerNumber===$answerNumber');
        //問題の変数をクラウドにある分だけ作成。
        final question = await FirebaseFirestore.instance.collection(
            '項目').doc('項目$i').collection('問題').doc('問題$b').get();


       //todo: 画像がアップされているか確認する必要がある。nullチェック？？



        setState(() {


          if (question['画像$b'] == 'null') {

            getImageList.add('null');
         getBoolFromImageFlagList.add(false);
            //boolのロジックが配列と喧嘩している。

          } else {

            getImageList.add(question['画像$b']);

            getBoolFromImageFlagList.add(true);
          }





        questionList.add(question['問題$b']);
        correctAnswerList.add(question['正解$b']);
        commentList.add(question['解説$b']);
        QLN = questionList.length;
        presentQuestion = questionList[questionNumber];
        presentComment = commentList[questionNumber];//questionNumber = 1を代入している。
        getBoolFromImageFlag = getBoolFromImageFlagList[questionNumber];
        print('presentQuestion---$presentQuestion');


           });

        print('getImageList===$getImageList');
        print('getBoolFromImageFlagList===$getBoolFromImageFlagList');
        print('getBoolFromImageFlag===$getBoolFromImageFlag');
        print('QLN===$QLN');
        print('questionList===$questionList');
        print('correctAnswerList===$correctAnswerList');
        for (int c = 1; c<=answerNumber; c++) {
          //答えの変数をクラウドにある分だけ作成。
          final answer = await FirebaseFirestore.instance.collection(
              '項目').doc('項目$i').collection('問題').doc('問題$b').collection('答え').doc('答え$c').get();
//c+1が４で割り切れるかどうかで場合分け
            setState(() {

              if (c == 1 || c == 1 + (4*c)) {
                answerList1.add(answer['答え$c']);

                ALN = answerList1.length;


              }

              else if (c == 2 || c == 2 + (4*c)) {
                answerList2.add(answer['答え$c']);

              }

              else if (c == 3 || c == 3 + (4*c)) {
                answerList3.add(answer['答え$c']);

              }

              else  if (c == 4 || c == 4 + (4*c)) {
                answerList4.add(answer['答え$c']);

              }

              else{
                print('答えの取得でエラーが発生しました。');
              }


               });
        }//for答え

        presentAnswer1 = answerList1[questionNumber];
        presentAnswer2 = answerList2[questionNumber];
         presentAnswer3 = answerList3[questionNumber];
         presentAnswer4 = answerList4[questionNumber];
        print('answerList１===${answerList1}');
        print('presentAnswer1${presentAnswer1}');
        print('presentAnswer2${presentAnswer2}');
        print('presentAnswer3${presentAnswer3}');
        print('presentAnswer4${presentAnswer4}');
        print('answerList2===${answerList2}');






      }//for問題





      } else {



        print('errorrrrrrrrr');
      }


    }//for項目





  }

  @override
  void initState() {
    super.initState();

    _getTitle();
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


  void ontapped(String text,String correctText,String name) {
//タップした際の挙動。
//オンタップ時に不具合あり。
    selectedAnswerList.add(text);

    if (text == correctText) {
      print('正解');

      setState(() {
        scorekeeper.add(
          const SizedBox(
              width: 25,
              child: Icon(Icons.panorama_fish_eye,
                color: Colors.red,
              )
          ),
        );

        truescorekeeper.add(const SizedBox(
            width: 25,
            child: Icon(Icons.panorama_fish_eye,
              color: Colors.red,
            )
        ),
        );

      });


    } else {
      var now = DateTime.now();

      var a = FirebaseFirestore.instance.collection('誤回答記録');//.doc(widget.name).collection(presentQuestion).doc(presentQuestion);

    //
    // a.add({
    //     '項目' :  name,
    //     '問題' :  presentQuestion,
    //     '実施日時' : '${now.year}/${now.month}/${now.day}/${now.hour}:${now.minute}',
    //     '誤回答' : text,
    //     '正解' : correctText,
    //     '解説' : presentComment,
    //    '画像' : getBoolFromImageFlag ? getImageList[questionNumber] :  null,
    //
    //
    //
    //   });





      wrongAnswerList.add(a);

      print('wrongAnswerList${wrongAnswerList}');




      print('不正解');
      setState(() {
        scorekeeper.add(
          const SizedBox(
              width: 25,
              child: Icon(Icons.close,
                color: Colors.green,
              )),);
      });

    }
    if (questionNumber < QLN -1){
  setState(() {

    titleNumber++;

    questionNumber++;
  presentQuestion = questionList[questionNumber];//二回目以降の代入ロジックを担当。
  presentComment = commentList[questionNumber];
    presentAnswer1 = answerList1[questionNumber];
    presentAnswer2 = answerList2[questionNumber];
    presentAnswer3 = answerList3[questionNumber];
    presentAnswer4 = answerList4[questionNumber];
    getBoolFromImageFlag = getBoolFromImageFlagList[questionNumber];
  });
} else {
  print('stop test');
  showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialogSample(name,text,correctText);
      });
      saveData();
      print(truescorekeeper.length.toString());
   // subjectList = [];
   // questionList = [];
   // answerList1 = [];
   // answerList2 = [];
   // answerList3 = [];
   // answerList4 = [];
   // correctAnswerList = [];
   // subjectListForFirstPage = [];
}





  }


  @override
  Widget build(BuildContext context) {
    return Column(
mainAxisAlignment: MainAxisAlignment.center,

      children: [



         Text('Q'+titleNumber.toString()),


           Text(presentQuestion ?? '読み込み中。。。'
           ),

          const SizedBox(
            height: 5,
          ),



        getBoolFromImageFlag ? SizedBox(
          width: 160,
            height: 160,
            child: Image.network(getImageList[questionNumber])) :  const SizedBox(
    height: 160

    ),




              const SizedBox(
                height: 10,
              ),

          GestureDetector(
              child: answerWidget(presentAnswer1 ?? '読み込み中。。。',
              ),
            onTap: () {
                if (presentAnswer1 != null ) {
                  ontapped(presentAnswer1,correctAnswerList[questionNumber],name);
                }

            },
          ),
          const SizedBox(
            height: 10,
          ),


          GestureDetector(
              child:answerWidget( presentAnswer2 ?? '読み込み中。。。'),
            onTap: () {
                if(presentAnswer2 != null) {
                  ontapped(presentAnswer2,correctAnswerList[questionNumber],name);
                }

            },
         ),


          const SizedBox(
            height: 10,
          ),
         GestureDetector(
              child: answerWidget(presentAnswer3 ?? '読み込み中。。。'
              ),
           onTap: () {
                if ( presentAnswer3 != null) {
                  ontapped(presentAnswer3,correctAnswerList[questionNumber],name);
                }

           },
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              child: answerWidget(presentAnswer4 ?? '読み込み中。。。'
              ),
            onTap: () {
                if (presentAnswer4 != null) {
                  ontapped(presentAnswer4,correctAnswerList[questionNumber],name);
                }

            },
          ),
          const SizedBox(
            height: 10,
          ),






          Row(
            children: scorekeeper
          ),


        ],




    );

  }
}


