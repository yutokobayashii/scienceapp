import 'package:flutter/material.dart';
import 'package:science/main.dart';
import 'package:science/questions.dart';
import 'package:science/testLast_page.dart';
import 'testmode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertDialogSample extends StatefulWidget {
  @override
  State<AlertDialogSample> createState() => _AlertDialogSampleState();
}

class _AlertDialogSampleState extends State<AlertDialogSample> {
  //const AlertDialogSample({Key? key}) : super(key: key);
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
          '今回の点数は${userScore}点です。',
          textAlign: TextAlign.center),
      content: Text(
          'テストの解説を表示しますか？'
          ,textAlign: TextAlign.center),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                //○だった時の処理を記載
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => testLast_page()),

                );
                questionNumber = 0;
              },
              child: Text('はい',
             style: TextStyle(
               color: Colors.indigoAccent
             ),
              )
            ),
            FlatButton(
              onPressed: () {
                //×だった時の処理を記載
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
                questionNumber = 0;
              },
              child: Text('いいえ',
                style: TextStyle(
                    color: Colors.indigoAccent
                ),
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