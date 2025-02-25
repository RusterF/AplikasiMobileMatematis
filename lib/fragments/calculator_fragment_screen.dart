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
          Expression exp = Parser().parse(expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          expression = eval.toString();
        } catch (e) {
          expression = "Error";
        }
      } else {
        if (expression.length < maxExpressionLength) {
          expression += value;
        }
      }
    });
  }

  Widget buildButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: color ?? Colors.grey[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
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
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              reverse: true,
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  expression,
                  style: const TextStyle(fontSize: 36, color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
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
                    buildButton("0"),
                    buildButton("=", color: Colors.indigo[600]),
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
