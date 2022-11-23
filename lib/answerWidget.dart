import 'package:flutter/material.dart';
import 'testmode.dart';


class answerWidget extends StatefulWidget {


  String text;
  answerWidget(this.text);

  @override
  State<answerWidget> createState() => _answerWidgetState();
}

class _answerWidgetState extends State<answerWidget> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue),
        ),
          child: Center(
            child: Text(widget.text,
            ),
          ),
      ),
    );
  }
}