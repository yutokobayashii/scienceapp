import 'package:flutter/material.dart';
import 'package:science/practicemode.dart';
import 'package:science/grafu.dart';
import 'package:science/testmode.dart';
import 'package:science/wrongAnswer.dart';
import 'record.dart';
class start_record extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
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
            GestureDetector(
                child: buildSizedBox('グラフ',
                ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => grafu(),
                  ),
                );
              },
            ),
            // SizedBox(
            //
            //   height: 30,
            // ),

          // GestureDetector(
          //     child: buildSizedBox('記録',
          //     ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => record(),
          //       ),
          //     );
          //   },
          // ),
            SizedBox(

              height: 30,
            ),

            GestureDetector(
                child: buildSizedBox('誤答集',
                ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => wrongAnswer(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );

  }

  SizedBox buildSizedBox(String text) {
    return SizedBox(
      width: 300,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue),
        ),
        child: Center(
          child: Text(text,
          ),
        ),
      ),
    );
  }



}
