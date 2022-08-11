import 'package:flutter/material.dart';


class wrongAnswer extends StatelessWidget {
  const wrongAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined), onPressed: () {
        Navigator.of(context).pop();
         }),
         title: Text('高校理科問題集'),
         centerTitle: true,

       elevation: 1,
        flexibleSpace: Image.network( // <-- ここで指定します。
         'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
         fit: BoxFit.cover,
        ),
          toolbarHeight: 100,
            // <-- ここで高さを指定してあげるとまた雰囲気が変わります
          backgroundColor: Colors.transparent,

         ),
        body:  GridView.count(
          shrinkWrap: true,
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                    //sizeをここで調整する。
                    children: <Widget>[
                      answerWidgetForWrong(),
                      answerWidgetForWrong(),
                      answerWidgetForWrong(),
                      answerWidgetForWrong(),


                    ]
                )
            )
        );






  }

}

class answerWidgetForWrong extends StatelessWidget {
  const answerWidgetForWrong({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("実施日：xx年xx月xx日"),
          Text("Q1:text"),
          Text("あなたの回答:text"),
          Text("正解:text"),
          Text("解説:text"),


        ],
      ),
    );

  }
}
