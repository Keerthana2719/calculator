import 'package:flutter/material.dart';

import 'button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final List<String> num = [
    "AC", "<-", "/", "%",
    "7", "8", "9", "*",
    "4", "5", "6", "-",
    "1", "2", "3", "+",
    "0", ".", "Ans", "="
  ];

  bool isOperator(String x) {
    return (x == "%" || x == "*" || x == "-" || x == "+" || x == "=" || x == "/");
  }

  String num1 = "";
  String num2 = "";
  String operand = "";
  String answer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                answer.isNotEmpty ? answer : "$num1$operand$num2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                child: Center(
                  child: GridView.builder(
                    itemCount: num.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Buttons(
                        color: buttonColor(index),
                        textcolor: buttonTextColor(index),
                        buttonText: num[index],
                        onPressed: () {
                          onButtonPressed(num[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color buttonColor(int index) {
    if (index == 0) {
      return Colors.red;
    } else if (index == 1) {
      return Colors.white60;
    } else {
      return isOperator(num[index]) ? Colors.lightGreen : Colors.purple;
    }
  }

  Color buttonTextColor(int index) {
    return isOperator(num[index]) ? Colors.black : Colors.white;
  }

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        num1 = "";
        num2 = "";
        operand = "";
        answer = "";
      } else if (buttonText == "<-") {
        if (answer.isNotEmpty) {
          answer = "";
        } else if (operand.isEmpty) {
          if (num1.isNotEmpty) {
            num1 = num1.substring(0, num1.length - 1);
          }
        } else {
          if (num2.isNotEmpty) {
            num2 = num2.substring(0, num2.length - 1);
          } else {
            operand = "";
          }
        }
      } else if (isOperator(buttonText)) {
        if (num1.isNotEmpty && num2.isNotEmpty ) {
          try {
            double n1 = double.parse(num1);
            double n2 = double.parse(num2);
            switch (operand) {
              case "+":
                answer = (n1 + n2).toString();
                break;
              case "-":
                answer = (n1 - n2).toString();
                break;
              case "*":
                answer = (n1 * n2).toString();
                break;
              case "/":
                answer = (n1 / n2).toString();
                break;
              case "%":
                answer = (n1 % n2).toString();
                break;
              default:
                answer = "Error";
            }
            num1 = answer;
            num2 = "";
            operand = buttonText;
          } catch (e) {
            answer = "Error";
          }
        } else if (num1.isNotEmpty) {
          operand = buttonText;
        }
      } else if (buttonText == "=") {
        if (num1.isNotEmpty && num2.isNotEmpty && operand.isNotEmpty) {
          try {
            double n1 = double.parse(num1);
            double n2 = double.parse(num2);
            switch (operand) {
              case "+":
                answer = (n1 + n2).toString();
                break;
              case "-":
                answer = (n1 - n2).toString();
                break;
              case "*":
                answer = (n1 * n2).toString();
                break;
              case "/":
                answer = (n1 / n2).toString();
                break;
              case "%":
                answer = (n1 % n2).toString();
                break;
              default:
                answer = "Error";
            }
            num1 = answer;
            num2 = "";
            operand = "";
          } catch (e) {
            answer = "Error";
          }
        }
      } else {
        if (answer.isNotEmpty) {
          num1 = "";
          num2 = "";
          operand = "";
          answer = "";
        }
        if (operand.isEmpty) {
          num1 += buttonText;
        } else {
          num2 += buttonText;
        }
      }
    }
    );
  }
}