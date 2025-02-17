import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "0";
  String? operation;
  double? firstValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.zero,
                child: Text(display,
                    style: TextStyle(fontSize: 35, color: Colors.white)))),
        Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.zero,
                child: Text(display,
                    style: TextStyle(fontSize: 35, color: Colors.white)))),
        Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.zero,
                child: Text(display,
                    style: TextStyle(fontSize: 35, color: Colors.white)))),
        Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.zero,
                child: Text(display,
                    style: TextStyle(fontSize: 35, color: Colors.white)))),
        Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.zero,
                child: Text(display,
                    style: TextStyle(fontSize: 35, color: Colors.white)))),
        Expanded(
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.zero,
                child: Text(display,
                    style: TextStyle(fontSize: 35, color: Colors.white)))),
        Expanded(child: buildButtonRow(['7', '8', '9', '/'])),
        Expanded(child: buildButtonRow(['4', '5', '6', '×'])),
        Expanded(child: buildButtonRow(['1', '2', '3', '−'])),
        Expanded(child: buildButtonRow(['AC', '0', '.', '+'])),
        Expanded(child: buildButtonRow(['', '', '', '='])),
      ],
    ));
  }

  Widget buildButtonRow(List<String> titles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: titles.map((title) => buildButton(title)).toList(),
    );
  }

  Widget buildButton(String title) {
    Color buttonColor;
    Color textColor = Colors.white; // デフォルトのテキストの色
    if (['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.']
        .contains(title)) {
      buttonColor = Colors.grey[800]!;
    } else if (['/', '×', '−', '+', '='].contains(title)) {
      buttonColor = Colors.orange;
    } else {
      buttonColor = Colors.grey[300]!;
      textColor = Colors.black;
    }

    return title.isEmpty
        ? Expanded(child: Container())
        : Expanded(
            child: Container(
              // margin: EdgeInsets.all(2.0), // ボタン間の間隔を設定
              // width: double.infinity,
              child: AspectRatio(
                aspectRatio: 1, // 正方形にする
                child: ElevatedButton(
                  onPressed: () => onButtonPressed(title),
                  child: Text(title,
                      style: TextStyle(fontSize: 24, color: textColor)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: buttonColor,
                    shape: CircleBorder(),
                    fixedSize:
                        Size.fromWidth(double.maxFinite), //横幅にmaxFiniteを指定
                  ),
                ),
              ),
            ),
          );
  }

  void onButtonPressed(String value) {
    setState(() {
      if ('0123456789'.contains(value)) {
        if (display == '0' || (operation != null && firstValue == null)) {
          display = value;
        } else {
          display += value;
        }
      } else if (value == 'AC') {
        display = '0';
        operation = null;
        firstValue = null;
      } else if (['+', '−', '×', '/'].contains(value)) {
        operation = value;
        firstValue = double.parse(display);
        display = '0';
      } else if (value == '=') {
        if (operation != null && firstValue != null) {
          switch (operation) {
            case '+':
              display = (firstValue! + double.parse(display)).toString();
              break;
            case '−':
              display = (firstValue! - double.parse(display)).toString();
              break;
            case '×':
              display = (firstValue! * double.parse(display)).toString();
              break;
            case '/':
              if (double.parse(display) == 0.0) {
                display = "Error";
              } else {
                display = (firstValue! / double.parse(display))
                    .toStringAsFixed(2); // 小数点以下2桁で表示
              }
              break;
          }
          firstValue = null;
          operation = null;
        }
      } else if (value == '.' && !display.contains('.')) {
        display += '.';
      }
    });
  }
}
