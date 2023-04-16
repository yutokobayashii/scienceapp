import 'package:flutter/material.dart';
import 'package:science/setting.dart';

import 'main.dart';

class privatepolicy extends StatelessWidget {
  const privatepolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: const Text('プライベートポリシー'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {


          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),

          );




        }),

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
      body: SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[

          Text('プライベートポリシー',
            style: TextStyle(
            fontSize: 20,
          ),
            ),

            SizedBox(
              height: 15,
            ),


            Text('science app （以下、「当サービス」といいます。）は、本ウェブサイト上で提供するサービスにおけ'
                '、ユーザーの個人情報の取扱いについて、以下のとおりプライバシーポリシー（以下、「本ポリシー」といいます。）を定めます。'),

            SizedBox(
              height: 15,
            ),


        Text('第1条（個人情報）',
          style: TextStyle(
            fontSize: 20,
          ),),


            SizedBox(
              height: 15,
            ),

            Text('「個人情報」とは、個人情報保護法にいう「個人情報」を指すものとし、生存する個人に関する情報であって、当該情報に含まれる氏名、生年月日、住所、電話番号、連絡先その他の記述等により特定の個人を識別できる情報及び容貌、指紋、声紋にかかるデータ、及び健康保険証の保険者番号などの当該情報単体から特定の個人を識別できる情報（個人識別情報）を指します。'),



            SizedBox(
              height: 15,
            ),


            Text('第2条（個人情報の収集）',
              style: TextStyle(
                fontSize: 20,
              ),),


            SizedBox(
              height: 15,
            ),

            Text('''ユーザーが当サービスを利用をする際に氏名、生年月日、住所、電話番号、メールアドレス、
            銀行口座番号、クレジットカード番号、運転免許証番号などの個人情報をお尋ねすることは一切ありません。
            '''),

            SizedBox(
              height: 15,
            ),


            Text('第3条（利用有無の変更）',
              style: TextStyle(
                fontSize: 20,
              ),),


            SizedBox(
              height: 15,
            ),

            Text('''当サービスは、個人情報利用開始が当サービスの向上に必要と判断した場合に限り、個人情報
の利用有無を変更するものとします。
 利用開始の変更を行った場合には、変更後の目的について、当サービス所定の方法により、ユー
ザーに通知し、または本ウェブサイト上に公表するものとします。
            '''),





            SizedBox(
              height: 15,
            ),


            Text('第4条（プライバシーポリシーの変更）',
              style: TextStyle(
                fontSize: 20,
              ),),


            SizedBox(
              height: 15,
            ),

            Text('''本ポリシーの内容は、法令その他本ポリシーに別段の定めのある事項を除いて、ユーザー
に通知することなく、変更することができるものとします。
 当社が別途定める場合を除いて、変更後のプライバシーポリシーは、本ウェブサイトに掲
載したときから効力を生じるものとします。
            '''),


            SizedBox(
              height: 15,
            ),


            Text('第5条（お問い合わせ窓口）',
              style: TextStyle(
                fontSize: 20,
              ),),


            SizedBox(
              height: 15,
            ),

            Text('''本ポリシーに関するお問い合わせは、下記の窓口までお願いいたします。
            
            email:ここにアドレス入れる
            
            
            '''),





          ],
        ),
      ),
    );
  }
}
