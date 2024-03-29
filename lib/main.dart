import 'package:flutter/material.dart';
import 'package:science/first_page.dart';
import 'package:science/setting.dart';
import 'package:science/second_page.dart';
import 'package:science/start_record.dart';
import 'package:science/title_list_page.dart';
import 'third_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'title_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());



}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

      // initialRoute: 'welcome_screen',
      // routes: {
      //   'welcome_screen':(context) => welcome_screen(),
     // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  var _selectIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final _pages = <Widget>[
    UserInformation(),
    start_record(),
      const settingWidget(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'クイズ',
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.history,
            ),
            label: '記録',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),



        ],
        currentIndex: _selectIndex,
        onTap: _onTapItem,
      ),


    );
  }
}
