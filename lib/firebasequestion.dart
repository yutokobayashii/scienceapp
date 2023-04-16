
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'questions.dart';

List<String> subjectList = [];
List<String> questionList = [];
List<String> answerList1 = [];
List<String> answerList2 = [];
List<String> answerList3 = [];
List<String> answerList4 = [];
List<String> correctAnswerList = [];
List<String> selectedAnswerList = [];
List<String> commentList = [];
List<String> getImageList = [];
List<bool> getBoolFromImageFlagList = [];
var sLN;
var QLN;
var ALN;
var wrongAnswerList = [];

var presentSubject;
var presentQuestion;
var presentComment;
var presentAnswer1 = '読み込み中';
var presentAnswer2 = '読み込み中';
var presentAnswer3 = '読み込み中';
var presentAnswer4 = '読み込み中';
var getBoolFromImageFlag = false;
