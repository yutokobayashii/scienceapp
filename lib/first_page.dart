

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:science/testmode.dart';
import 'dart:core';
import 'dart:async';

import 'package:science/title_list_page.dart';

var SNForfirstpage;
var subjectNumberForfirstpage;
List<String> subjectListForFirstPage = [];
//
// void firebaseSubjectLogic() async {
//   SNForfirstpage = await FirebaseFirestore.instance.collection('単元').get();
//
//
//   subjectNumberForfirstpage = SNForfirstpage.docs.length;
//
//   for (int a = 1; a <= subjectNumberForfirstpage; a++) {
//     final subject = await FirebaseFirestore.instance.collection(
//         '単元').doc('単元${a}').get();
//     //単元の変数をクラウドにある分だけ作成。
//
//
//       subjectListForFirstPage.add(subject['単元${a}']);
//
//
//
//   }
// }


class firstPage extends StatefulWidget {


  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();




    }


class _firstPageState extends State<firstPage> {




  void firebaseSubjectLogic() async {


    SNForfirstpage = await FirebaseFirestore.instance.collection('単元').get();


    subjectNumberForfirstpage = SNForfirstpage.docs.length;

    for (int a = 1; a <= subjectNumberForfirstpage; a++) {
      final subject = await FirebaseFirestore.instance.collection(
          '単元').doc('単元${a}').get();
      //単元の変数をクラウドにある分だけ作成。


      setState(() {
        subjectListForFirstPage.add(subject['単元${a}']);
      });





    }
  }



  @override
  void initState() {
    super.initState();


    firebaseSubjectLogic();

    print('subjectNumberForfirstpage===${subjectNumberForfirstpage}');
    print('subjectListForFirstPage===${subjectListForFirstPage}');
//呼び出す場所が悪い。アプリを起動したタイミングで呼び出しても良いのでは？
  }




  @override
  Widget build(BuildContext context) {

    return buildMaterialApp(context);

}





  MaterialApp buildMaterialApp(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(

        title: Text('高校理科問題集'),
        centerTitle: true,

        elevation: 1,
        flexibleSpace: Image.network(// <-- ここで指定します。
        'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
        fit: BoxFit.cover,
        ),
        toolbarHeight: 100,// <-- ここで高さを指定してあげるとまた雰囲気が変わります
        backgroundColor: Colors.transparent,

      ),
        body:FutureBuilder(
          future: FirebaseFirestore.instance.collection('単元').get(),
          builder: (context, snapshot) {
            // 取得が完了していないときに表示するWidget
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }

            // エラー時に表示するWidget
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('エラー');
            }

            // データが取得できなかったときに表示するWidget
            if (!snapshot.hasData) {
              return Text('データがない');
            }

            // 取得したデータを表示するWidget
            return ListView(
                children: [

                  for(var i = 0; i  < subjectNumberForfirstpage ; i++)

                    GestureDetector(
                        child: menuItem(subjectListForFirstPage[i] ,Icon(Icons.done_all_sharp),context),
                        //ここがrangeerror起きてる。
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => testmode(subjectListForFirstPage[i]),
                            ),
                          );
                        }
                    ),


                ]

            );
          },
        ),
    ),
  );
  }

  Widget menuItem(String title, Icon icon,BuildContext context) {
    return SizedBox(
      height: 70,
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child:icon,
              ),
              Text(
                title ,
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 18.0
                ),
              ),
            ],

      ),
      ),
    );
  }
}


