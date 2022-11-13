
import 'package:cloud_firestore/cloud_firestore.dart';
import 'questions.dart';

List<String> subjectList = [];
List<String> questionList = [];
List<String> answerList = [];
List<String> correctAnswerList = [];

var SLN;
var QLN;
var ALN;

var presentSubject;
var presentQuestion;
var presentAnswer1 = '読み込み中';
var presentAnswer2 = '読み込み中';
var presentAnswer3 = '読み込み中';
var presentAnswer4 = '読み込み中';

//ここをリスト化すればいい感じになりそうかも。

//
// void firebaselogic() async{
// //ここのロジックを別ファイルに分けたいなー
// //widgetをfor文でループ処理に切り替える必要がある。
//
//
//
//   final SN = await FirebaseFirestore.instance.collection('単元').get();
//
//
//   final int subjectNumber = SN.docs.length;
//
//   print('subjectNumber===${subjectNumber}');
//
//   for (int a = 1; a<=subjectNumber; a++) {
//
//     final  QN = await FirebaseFirestore.instance.collection(
//         '単元').doc('単元${a}').collection('問題').get();
//     final int questionNumberForRecord = QN.docs.length;
//     //問題の数を記録
//
//     print('questionNumberForRecord===${questionNumberForRecord}');
//     final subject = await FirebaseFirestore.instance.collection(
//         '単元').doc('単元${a}').get();
//     //単元の変数をクラウドにある分だけ作成。
//    // setState(() {
//
//       subjectList.add(subject['単元${a}']);
//       SLN = subjectList.length;
//   //  });
//
//     print('subjectList===${subjectList}');
//
//     for (int b = 1; b<=questionNumberForRecord; b++) {
//       //答えの数を記録
//       final AN = await FirebaseFirestore.instance.collection(
//           '単元').doc('単元${a}').collection('問題').doc('問題${b}').collection('答え').get();
//       final int answerNumber = AN.docs.length;
//
//       print('answerNumber===${answerNumber}');
//       //問題の変数をクラウドにある分だけ作成。
//       final question = await FirebaseFirestore.instance.collection(
//           '単元').doc('単元${a}').collection('問題').doc('問題${b}').get();
//
//
//     //  setState(() {
// print('questionnumber===${questionNumber}');
//         questionList.add(question['問題${b}']);
//         QLN = questionList.length;
//         presentQuestion = questionList[questionNumber];//questionNumber = 1を代入している。
//
//       print('presentQuestion---${presentQuestion}');
//
//   //    });
//       print('questionList===${questionList}');
//
//       for (int c = 1; c<=answerNumber; c++) {
//         //答えの変数をクラウドにある分だけ作成。
//         final answer = await FirebaseFirestore.instance.collection(
//             '単元').doc('単元${a}').collection('問題').doc('問題${b}').collection('答え').doc('答え${c}').get();
//
//       //  setState(() {
//
//           answerList.add(answer['答え${c}']);
//           ALN = answerList.length;
//   //      });
//       }
//       print('answerList===${answerList}');
//
//
//
//
//     }//問題for
//
//   }//単元for
//
//
// }