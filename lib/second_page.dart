import 'package:flutter/material.dart';
import 'package:science/grafu.dart';
import 'start_record.dart';

class second_page extends StatefulWidget {
  const second_page({Key? key}) : super(key: key);

  @override
  State<second_page> createState() => _second_pageState();
}

class _second_pageState extends State<second_page> {
  void onTapped() {

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) => start_record(),
      ),
    );

  }

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
            body: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  GestureDetector(
                      child: buildContainer('単元1'
                      ),
                    onTap: () {
                     onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元2',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元3',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元4',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元5',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元6',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元7',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元8',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元9',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),
                  GestureDetector(
                      child: buildContainer('単元10',
                      ),
                    onTap: () {
                      onTapped();
                    },
                  ),





      ],
            )
        )
    );
  }

//todo; ダサいからここを変えたい　色々調べたい
  Container buildContainer(String text) {
    return Container(
          padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Container(

            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Images/3577116_s.jpg'),
                  fit: BoxFit.cover,
                )),

            child: Center(child: Text(text))),
      );
  }
}
