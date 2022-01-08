import 'dart:convert';
import 'package:math_expressions/math_expressions.dart';

class Operation {
  String value;
  String getOperation(value) {
    //print(value);
    try {
      value = value.replaceAll('÷', '/');
      value = value.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(value);
      //double eval = exp.simplify();
      double res = double.parse(exp.evaluate(EvaluationType.REAL, ContextModel()).toString());
      if (res is int) {
        return res.toString();
      } else {
        //return res.toStringAsFixed(3);
        return res.toString();
      }
    } catch (e) {
      //print('hello $e');
      return 'Bad Expression';
    }
  }
}
