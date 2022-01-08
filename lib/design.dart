import 'package:flutter/material.dart';
import 'operation.dart';

String value = '0';
Operation operation = Operation();
String result = '0';

class CalculatorDesign extends StatefulWidget {
  _CalculatorDesignState createState() => _CalculatorDesignState();
}

class _CalculatorDesignState extends State<CalculatorDesign> {
  Widget buildButton(String symbol, double h, Color colour) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * h,
      color: colour,
      child: FlatButton(
        onPressed: (() {
          setState(() {
            if (symbol != 'C' && symbol != '=' && symbol != '⌫') {
              if (value == '0') {
                value = symbol;
              } else {
                value += symbol;
              }
            } else {
              if (symbol == '=') {
                result = operation.getOperation(value);
              }

              if (symbol == 'C') {
                result = '0';
                value = '0';
              }

              if (symbol == '⌫') {
                value = value.substring(0, value.length - 1);
                if (result == '') {
                  result = '0';
                }
              }
            }
          });
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        child: Text(
          symbol,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 27.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text('Basic Calculator'),
      ),
      body: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                value,
                style: TextStyle(fontSize: 38.0),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
            Expanded(child: Divider()),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton('C', 1, Colors.red),
                          buildButton('⌫', 1, Colors.blue),
                          buildButton('÷', 1, Colors.blue),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('7', 1, Colors.grey[600]),
                          buildButton('8', 1, Colors.grey[600]),
                          buildButton('9', 1, Colors.grey[600]),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('4', 1, Colors.grey[600]),
                          buildButton('5', 1, Colors.grey[600]),
                          buildButton('6', 1, Colors.grey[600]),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('1', 1, Colors.grey[600]),
                          buildButton('2', 1, Colors.grey[600]),
                          buildButton('3', 1, Colors.grey[600]),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('.', 1, Colors.grey[600]),
                          buildButton('0', 1, Colors.grey[600]),
                          buildButton('00', 1, Colors.grey[600]),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          buildButton('x', 1, Colors.blue),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('-', 1, Colors.blue),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('+', 1, Colors.blue),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('=', 2, Colors.red),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
