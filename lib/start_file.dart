import 'package:flutter/material.dart';
import 'package:science/practicemode.dart';
import 'package:science/testmode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebasequestion.dart';


class start_file extends StatelessWidget {



  start_file(this.name);
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 130,
              height: 40,
              child: OutlinedButton(
                child: const Text('練習モード'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.green),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => practicemode("${name}"),
                    ),
                  );
                },
              ),
            ),
            SizedBox(

              height: 30,
            ),

            SizedBox(
              width: 130,
              height: 40,
              child: OutlinedButton(
                child: const Text('テストモード'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.green),
                ),
                onPressed: () {
                 // firebaselogic();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => testmode("${name}"),
                    ),
                  );
                },
              ),
            ),



//
//             SizedBox(
//               width: 130,
//               height: 40,
//               child: OutlinedButton(
//
//                 child: const Text('firebase'),
//                 style: OutlinedButton.styleFrom(
//                   primary: Colors.black,
//                   shape: const StadiumBorder(),
//                   side: const BorderSide(color: Colors.green),
//                 ),
//                 onPressed: () async {
//                   final date =
//                   DateTime.now().toLocal().toIso8601String(); // 現在の日時
//                  // final email = widget.user.email; // AddPostPage のデータを参照
//                   // 投稿メッセージ用ドキュメント作成
//
//
//                   await FirebaseFirestore.instance
//                       .collection('tests') // コレクションID指定
//                       .doc('9KybUiEkqo6hoMUJy1wo') // ドキュメントID自動生成
//                       .set({
//
//                     'date': date
//
//                   });
//
//
//
//                   // 1つ前の画面に戻る
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ),

//

          ],
        ),
      ),
    );

  }



}




