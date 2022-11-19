import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'first_page.dart';



int questionNumber = 0;

int titleNumber = questionNumber + 1;


var titleHolder1;
var titleHolder2;
var titleHolder3;
var titleHolder4;
var titleHolder5;
var titleHolder6;
var titleHolder7;
var titleHolder8;
var titleHolder9;
var titleHolder10;


void inputTitleHolder() {

  if (subjectNumberForfirstpage == 1 ){

  titleHolder1 =  subjectListForFirstPage[0];

  }
  else if (subjectNumberForfirstpage == 2) {


  }
}