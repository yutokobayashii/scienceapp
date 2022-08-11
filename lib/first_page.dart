

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:science/start_file.dart';


class firstPage extends StatelessWidget {


  const firstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




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
          body: ListView(
             children: [

               for(var i = 1; i < 11; i++)

                 GestureDetector(
                     child: menuItem("単元${i}",Icon(Icons.done_all_sharp),context),
                     onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => start_file("単元${i}"),
                         ),
                       );
                     }
                 ),


               ]

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
                title,
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