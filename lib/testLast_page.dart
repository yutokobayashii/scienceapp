import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:science/firebasequestion.dart';

import 'first_page.dart';
import 'main.dart';






class testLast_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('解説'),
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {


    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp()),

    );
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

    }
    ),

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            for (int i = 0; i<QLN; i++)...{


              SizedBox(
                height: 30,
              ),

              Card(
                color: Colors.white70,
                child: InkWell(
                  splashColor: Colors.cyan,
                  onTap: () {
                    debugPrint('Card taped');
                  },
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text('Q${i+1}',
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Container(
                          width: double.infinity,
                          child: Text('問題：${questionList[i]}',
                            textAlign: TextAlign.left,),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Container(
                          width: double.infinity,
                          child: Text('あなたの回答：${selectedAnswerList[i]}',
                            textAlign: TextAlign.left,),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text('正解：${correctAnswerList[i]}',
                            textAlign: TextAlign.left,),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text('解説：${commentList[i]}',
                            textAlign: TextAlign.left,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            },

          ],
        ),
      ),

    );
  }
}
