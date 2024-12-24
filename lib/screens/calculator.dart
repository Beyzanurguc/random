import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/calculator_button.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userQuestion = "";
  var userEnter = "";

  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FEFE),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 254, 254),
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userQuestion,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userEnter,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  //C button
                  if (index == 0) {
                    return MyButton(
                      color: Colors.greenAccent,
                      textColor: Colors.black,
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          userQuestion = " ";
                        });
                      },
                    );
                    //DEL button
                  } else if (index == 1) {
                    return MyButton(
                      color: const Color.fromARGB(255, 243, 159, 215),
                      textColor: Colors.black,
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                    );
                    //= button
                  } else if (index == buttons.length - 1) {
                    return MyButton(
                      color: const Color.fromARGB(255, 79, 210, 210),
                      textColor: Colors.black,
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                    );
                  } else {
                    return MyButton(
                      color: isOperator(buttons[index])
                          ? const Color.fromARGB(255, 79, 210, 210)
                          : const Color.fromARGB(255, 169, 235, 235),
                      textColor: Colors.black,
                      buttonText: buttons[index],
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "+" || x == "-" || x == "x" || x == "=") {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userEnter = eval.toString();
  }
}
