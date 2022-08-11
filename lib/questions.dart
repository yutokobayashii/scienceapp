import 'package:flutter/material.dart';
import 'dart:math';
class questions{

String questionText = "";
String questionAnswer = "";


questions( String q, String a ) {
  questionText = q;
  questionAnswer = a;

}

}

// todo; クラスを二つに分ける。１、問題と解答　解答四つ
int questionNumber = 0;
// questions q1 = questions(q: '小林は天才でしょうか？',a: 'はい');

List<questions> questionBank = [
  questions('小林は天才でしょうか？1','はい1'),
  questions('小林は天才でしょうか？2','はい2'),
  questions('小林は天才でしょうか？3','はい3'),
  questions('小林は天才でしょうか？4','はい4'),
  questions('小林は天才でしょうか？5','はい5'),
  questions('小林は天才でしょうか？6','はい6'),
  questions('小林は天才でしょうか？7','はい7'),
  questions('小林は天才でしょうか？8','はい8'),
  questions('小林は天才でしょうか？9','はい9'),
  questions('小林は天才でしょうか？10','はい10'),

];

class answer{

  String Answer1 = '';
  String Answer2 = '';
  String Answer3 = '';
  String Answer4 = '';

answer(String a1,String a2, String a3, String a4){
 Answer1 = a1;
 Answer2 = a2;
 Answer3 = a3;
 Answer4 = a4;

}
}

List<answer> answerBank = [

  answer('いいえ1','はい1','いいえ1','いいえ1'),
  answer('いいえ2','いいえ2','はい2','いいえ2'),
  answer('いいえ3','はい3','いいえ3','いいえ3'),
  answer('いいえ4','いいえ4','いいえ4','はい4'),
  answer('はい5','いいえ5','いいえ5','いいえ5'),
  answer('いいえ6','はい6','いいえ6','いいえ6'),
  answer('いいえ7','いいえ7','いいえ7','はい7'),
  answer('いいえ8','はい8','いいえ8','いいえ8'),
  answer('いいえ9','はい9','いいえ9','いいえ9'),
  answer('いいえ10','いいえ10','はい10','いいえ10'),



];

