import 'package:flutter/material.dart';
import 'package:science/practicemode.dart';
import 'package:science/testmode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => testmode("${name}"),
                    ),
                  );
                },
              ),
            ),


    Container(
          height: double.infinity,
          alignment: Alignment.topCenter,
          //1
          child: StreamBuilder<QuerySnapshot>(
            //2
            stream: FirebaseFirestore.instance
                .collection('dream')
                .orderBy('createdAt')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('エラーが発生しました');
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              //3
              final list = snapshot.requireData.docs
                  .map<String>((DocumentSnapshot document) {
                final documentData =
                document.data()! as Map<String, dynamic>;
                return documentData['content']! as String;
              }).toList();

              final reverseList = list.reversed.toList();

              return ListView.builder(
                itemCount: reverseList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Text(
                      reverseList[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                },
              );
            },
          ),
    ),

          ],
        ),
      ),
    );

  }



}




