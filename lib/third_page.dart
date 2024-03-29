import 'package:flutter/material.dart';

class third_page extends StatelessWidget {
  const third_page({Key? key}) : super(key: key);

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
            body: const Text('test'),
        )
    );
  }
}
