import 'package:flutter/material.dart';
import 'package:science/privatepolicy.dart';
import 'package:science/riyoukiysku.dart';




class settingWidget  extends StatelessWidget {
  const settingWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(

        appBar: AppBar(

        title: const Text('高校理科問題集'),
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


              const SizedBox(
                height: 12,
              ),

              ListTile(
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => riyoukiyaku()),
                    );
                    print("onTap called.");
                  },child: const Text('利用規約',
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 20.0
                ),
                ),
                ),

                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.lightBlueAccent),
              ),


              const SizedBox(
                height: 12,
              ),
              const Divider(
                height: 5,
                thickness: 0,
                //indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),

              const SizedBox(
                height: 12,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => privatepolicy()),
                  );
                  print("onTap called.");
                },
                child: const ListTile(
                  title: Text('プライベートポリシー',
                    style: TextStyle(
                        color:Colors.black,
                        fontSize: 20.0
                    ),
                  ),


                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.lightBlueAccent),
                ),
              ),


            const SizedBox(
              height: 12,
            ),


              const Divider(
                height: 5,
                thickness: 0,
                //indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),



              const SizedBox(
                height: 12,
              ),//区切り線
          ListTile(
            title:  GestureDetector(
              onTap: () {
                print("onTap called.");
              },child: const Text('developerへお問合せ',
              style: TextStyle(
                  color:Colors.black,
                  fontSize: 20.0
              ),
            ),
            ),

            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.lightBlueAccent),
          ),



              const SizedBox(
                height: 12,
              ),


              const Divider(
                color: Colors.black,
              ),
            ],

          ),

    ),


    );
  }
}
