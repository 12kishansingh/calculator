import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '00',
    '.',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 235, 235),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //color: Colors.deepPurple,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  if (index == 0) {
                    return Mybutton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: const Color.fromARGB(182, 76, 175, 79),
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                    );
                  } else if (index == 1) {
                    return Mybutton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: const Color.fromARGB(185, 244, 67, 54),
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                    );
                  } 
                   else if (index == buttons.length-1) {
                    return Mybutton(
                      buttonTapped: () {
                        setState(() {
                         equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color:  Colors.deepPurple[100],
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                    );
                  } 

                  else {
                    return Mybutton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple[100]
                          : const Color.fromARGB(77, 176, 223, 221),
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=' || x == '%') {
      return true;
    }
    return false;
  }

  // build parser
  void equalPressed(){

    String finalquestion=userQuestion;
    finalquestion=finalquestion.replaceAll('x', '*');
    Parser p = Parser();
  Expression exp = p.parse(finalquestion);
   ContextModel cm = ContextModel();
   double eval = exp.evaluate(EvaluationType.REAL, cm);
   userAnswer=eval.toString();
  }
}
