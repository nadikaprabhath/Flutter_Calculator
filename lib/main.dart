import 'package:flutter/material.dart';
import 'package:flutter_assignment/widget/calBtn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Cal());
}

class Cal extends StatefulWidget {
  Cal({Key key}) : super(key: key);

  @override
  CalState createState() => CalState();
}

class CalState extends State<Cal> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClean(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 24),
                  color: Color(0xFF545F61),
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(fontSize: 48),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalBtn(
                  text: 'AC',
                  callback: allClean,
                  fillColor: 0xFF6c807F,
                  textSize: 23,
                ),
                CalBtn(
                  text: 'C',
                  callback: clear,
                  fillColor: 0xFF6c807F,
                ),
                CalBtn(
                  text: '%',
                  callback: numClick,
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                ),
                CalBtn(
                  text: '/',
                  callback: numClick,
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalBtn(
                  text: '7',
                  callback: numClick,
                ),
                CalBtn(
                  text: '8',
                  callback: numClick,
                ),
                CalBtn(
                  text: '9',
                  callback: numClick,
                ),
                CalBtn(
                  text: '*',
                  callback: numClick,
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 35,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalBtn(
                  text: '4',
                  callback: numClick,
                ),
                CalBtn(
                  text: '5',
                  callback: numClick,
                ),
                CalBtn(
                  text: '6',
                  callback: numClick,
                ),
                CalBtn(
                  text: '-',
                  callback: numClick,
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 40,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalBtn(
                  text: '1',
                  callback: numClick,
                ),
                CalBtn(
                  text: '2',
                  callback: numClick,
                ),
                CalBtn(
                  text: '3',
                  callback: numClick,
                ),
                CalBtn(
                  text: '+',
                  callback: numClick,
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  textSize: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalBtn(
                  text: '.',
                  callback: numClick,
                ),
                CalBtn(
                  text: '0',
                  callback: numClick,
                ),
                CalBtn(
                  text: '00',
                  callback: numClick,
                ),
                CalBtn(
                  text: '=',
                  callback: evaluate,
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
