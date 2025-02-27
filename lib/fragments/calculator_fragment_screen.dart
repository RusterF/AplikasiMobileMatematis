import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorFragmentScreen extends StatefulWidget {
  const CalculatorFragmentScreen({super.key});

  @override
  CalculatorFragmentScreenState createState() =>
      CalculatorFragmentScreenState();
}

class CalculatorFragmentScreenState extends State<CalculatorFragmentScreen> {
  String expression = "";
  final int maxExpressionLength = 50;

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        expression = "";
      } else if (value == "←") {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (value == "=") {
        try {
          String sanitizedExpression = expression.replaceAll(",", ".");
          Expression exp = GrammarParser().parse(sanitizedExpression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          expression = eval.toString();
        } catch (e) {
          expression = "Error";
        }
      } else {
        if (expression.length < maxExpressionLength) {
          if (value == "-" &&
              (expression.isEmpty ||
                  "+-*/(".contains(expression[expression.length - 1]))) {
            expression += value;
          } else if (value != "-" || expression.isNotEmpty) {
            expression += value;
          }
        }
      }
    });
  }

  Widget buildButton(String text, {Color? color, double flex = 1}) {
    return Expanded(
      flex: flex.toInt(),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: color ?? Colors.grey[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Text(
          "Kalkulator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.end, 
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              color: Colors.grey[200], 
              child: Wrap(
                alignment: WrapAlignment.end,
                children: [
                  Text(
                    expression,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    buildButton("C", color: Colors.red),
                    buildButton("(", color: Colors.indigo[600]),
                    buildButton(")", color: Colors.indigo[600]),
                    buildButton("←", color: Colors.red),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("+", color: Colors.indigo[600]),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-", color: Colors.indigo[600]),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton(",", color: Colors.indigo[600]),
                  ],
                ),
                Row(
                  children: [
                    buildButton("0", flex: 2),
                    buildButton("=", color: Colors.indigo[600], flex: 2),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
