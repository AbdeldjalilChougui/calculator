import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String tapedValue = "0";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNeg = false;
  double? num1,num2;
  String? type;
  int serie = 0;

  printIn(String value) {
    setState(() {
      if (widget.tapedValue.codeUnitAt(0) == 48 && !widget.tapedValue.contains("."))
        widget.tapedValue = value;
      else
        widget.tapedValue += value;
    });
  }

  double? calculate (String typeCalc) {
    if (typeCalc == "/") {
      return num1! / num2!;
    }
    if (typeCalc == "x") {
      return num1! * num2!;
    }
    if (typeCalc == "-") {
      return num1! - num2!;
    }
    if (typeCalc == "+") {
      return num1! + num2!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.tapedValue,
                maxLines: 2,
                style: TextStyle(fontSize: 50),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.tapedValue = "0";
                              isNeg = false;
                              serie = 0;
                            });
                          },
                          child: Button(color: Colors.grey, text: "C"),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (widget.tapedValue.codeUnitAt(0) != 48 ||
                                  widget.tapedValue.codeUnitAt(0) == 48 && widget.tapedValue.contains("."))
                                isNeg = !isNeg;
                              if (isNeg) {
                                if (widget.tapedValue.codeUnitAt(0) != 48 && widget.tapedValue.codeUnitAt(0) != 45) {
                                  widget.tapedValue = "-" + widget.tapedValue;
                                }
                                else if (widget.tapedValue.codeUnitAt(0) == 48 && widget.tapedValue.contains(".")) {
                                  widget.tapedValue = "-" + widget.tapedValue;
                                }
                              }
                              else {
                                if (widget.tapedValue.codeUnitAt(0) != 48)
                                  widget.tapedValue = widget.tapedValue.substring(1);
                              }
                            });
                          },
                          child: Button(color: Colors.grey, text: "+/-"),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.tapedValue = (double.parse(widget.tapedValue) / 100).toString();
                            });
                          },
                          child: Button(color: Colors.grey, text: "%"),
                        ),
                        GestureDetector(
                          onTap: () {
                            num1 = double.parse(widget.tapedValue);
                            setState(() {
                              widget.tapedValue = "0";
                              type = "/";
                              serie = 0;
                            });
                          },
                          child: Button(color: Colors.orange, text: "/"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            printIn("7");
                          },
                          child: Button(color: Colors.black54, text: "7"),
                        ),
                        GestureDetector(
                          onTap: () {
                            printIn("8");
                          },
                          child: Button(color: Colors.black54, text: "8"),
                        ),
                        GestureDetector(
                          onTap: () {
                            printIn("9");
                          },
                          child: Button(color: Colors.black54, text: "9"),
                        ),
                        GestureDetector(
                          onTap: () {
                            num1 = double.parse(widget.tapedValue);
                            setState(() {
                              widget.tapedValue = "0";
                              type = "x";
                              serie = 0;
                            });
                          },
                          child: Button(color: Colors.orange, text: "x"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            printIn("4");
                          },
                          child: Button(color: Colors.black54, text: "4"),
                        ),
                        GestureDetector(
                          onTap: () {
                            printIn("5");
                          },
                          child: Button(color: Colors.black54, text: "5"),
                        ),
                        GestureDetector(
                          onTap: () {
                            printIn("6");
                          },
                          child: Button(color: Colors.black54, text: "6"),
                        ),
                        GestureDetector(
                          onTap: () {
                            num1 = double.parse(widget.tapedValue);
                            setState(() {
                              widget.tapedValue = "0";
                              type = "-";
                              serie = 0;
                            });
                          },
                          child: Button(color: Colors.orange, text: "-"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            printIn("1");
                          },
                          child: Button(color: Colors.black54, text: "1"),
                        ),
                        GestureDetector(
                          onTap: () {
                            printIn("2");
                          },
                          child: Button(color: Colors.black54, text: "2"),
                        ),
                        GestureDetector(
                          onTap: () {
                            printIn("3");
                          },
                          child: Button(color: Colors.black54, text: "3"),
                        ),
                        GestureDetector(
                          onTap: () {
                            num1 = double.parse(widget.tapedValue);
                            setState(() {
                              widget.tapedValue = "0";
                              type = "+";
                              serie = 0;
                            });
                          },
                          child: Button(color: Colors.orange, text: "+"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            printIn("0");
                          },
                          child: Container(
                            width: 160,
                            height: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              color: Colors.black54,
                              child: Center(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (!widget.tapedValue.contains("."))
                                widget.tapedValue += ".";
                            });
                          },
                          child: Button(color: Colors.black54, text: "."),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (serie == 0)
                              num2 = double.parse(widget.tapedValue);
                            setState(() {
                              serie++;
                              if (calculate(type!)! % 1 == 0)
                                widget.tapedValue = calculate(type!)!.toInt().toString();
                              else
                                widget.tapedValue = calculate(type!)!.toString();
                            });
                            num1 = double.parse(widget.tapedValue);
                          },
                          child: Button(color: Colors.orange, text: "="),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  Button({this.color, this.text});

  final color;
  final text;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Card(
        shape: CircleBorder(),
        color: widget.color,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
