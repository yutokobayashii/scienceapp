import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:science/testmode.dart';
import 'package:science/wrongAnserRecord.dart';
import 'package:shared_preferences/shared_preferences.dart';


class wrongAnswer extends StatelessWidget {
   wrongAnswer({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('誤回答記録').snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined), onPressed: () {
        Navigator.of(context).pop();
         }),
         title: const Text('誤答集'),
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
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            if (snapshot.data == null) {
              return const Text("null error");
            }

            return ListView(
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                return ListTile(
                    title: Text(data['項目']
                      ,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                        decoration: TextDecoration.underline,


                      ),
                    ),
                    subtitle:  Text(data['実施日時']),
                    leading:  const Icon(Icons.check,color: Colors.cyan,),

                    onTap: () {

                      // saveData1() async {
                      //
                      //   SharedPreferences pref = await SharedPreferences.getInstance();
                      //
                      //   pref.setString("title",data['項目'] );
                      //
                      // }
                      //
                      // saveData1();
                      //
                      //
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => wrongAnswerRecord(),
                      //   ),
                      // );
                    }

                );
              })
                  .toList()
                  .cast(),
            );
          },
        ),
            )
        );






  }

}


