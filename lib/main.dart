import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
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
      backgroundColor: Color.fromARGB(255, 237, 235, 235),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //color: Colors.deepPurple,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  if(index==0){
                    return Mybutton(
                    buttonText:buttons[index],
                    color:Color.fromARGB(182, 76, 175, 79),
                    textColor: Color.fromARGB(255, 0, 0, 0),
                  );
                  }
                  else if(index==1){
                    return Mybutton(
                    buttonText:buttons[index],
                    color:Color.fromARGB(185, 244, 67, 54),
                    textColor: Color.fromARGB(255, 0, 0, 0),
                  );
                  }
                  return Mybutton(
                    buttonText:buttons[index],
                    color:isOperator(buttons[index])? Colors.deepPurple[100]:Color.fromARGB(77, 176, 223, 221),
                    textColor: Color.fromARGB(255, 0, 0, 0),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  bool isOperator(String x){
    if(x=='/'|| x=='X'|| x=='-'||x=='+'||x=='='|| x=='%'){
      return true;
    }
    return false;
  }
}
