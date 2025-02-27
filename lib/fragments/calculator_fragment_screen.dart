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
          // Handle negative numbers correctly
          if (value == "-" &&
              (expression.isEmpty ||
                  "+-*/(".contains(expression[expression.length - 1]))) {
            expression += value; // Allow negative numbers
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
        padding: const EdgeInsets.all(4.0), // Reduced padding
        child: ElevatedButton(
          onPressed: () => onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16), // Reduced height
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: color ?? Colors.grey[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8,
              ), // Slightly smaller buttons
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
          // Display Section (More Flexible)
          Expanded(
            flex: 3, // Increased flex to give it more space
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(
                16,
              ), // Reduced padding to save space
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Text(
                  expression,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                  ), // Slightly smaller font
                ),
              ),
            ),
          ),
          // Button Grid (Adjusted)
          Expanded(
            flex: 5, // Reduced flex to push buttons up
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
