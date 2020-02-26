import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final TextEditingController _num1controller = TextEditingController();
  final TextEditingController _num2controller = TextEditingController();
  final TextEditingController _num3controller = TextEditingController();
  final TextEditingController _num4controller = TextEditingController();
  double num1 = 0.0, num2 = 0.0, num3 = 0.0, num4 = 0.0, result = 0.0;
  double value = 0;
  String a = 'Operation';
  String img = "assets/images/calculator.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fraction Calculator',
      home: Scaffold(
        appBar: AppBar(
            title: Center(
              child: new Text("Fraction Calculator"),
            ),
            backgroundColor: Colors.purple),
        body: Center(
          child: Column(
            
            children: <Widget>[
              Image.asset(
                  img,
                  scale: 5,
                ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(width: 50.0),
                    new Flexible(
                      child: TextFormField(
                        controller: _num1controller,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.horizontal(),
                            )),
                      ),
                    ),
                    SizedBox(width: 180.0),
                    new Flexible(
                      child: TextField(
                        controller: _num3controller,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.horizontal(),
                            )),
                      ),
                    ),
                    SizedBox(width: 50.0),
                  ]),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                    child: Text(
                        "______________                                           ______________"),
                  )
                ],
              ),
              Text(
                "$a",
                style: TextStyle(fontSize: 16),
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(width: 50.0),
                    new Flexible(
                      child: TextField(
                        controller: _num2controller,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.horizontal(),
                            )),
                      ),
                    ),
                    SizedBox(width: 180.0),
                    new Flexible(
                      child: TextField(
                        controller: _num4controller,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.horizontal(),
                            )),
                      ),
                    ),
                    SizedBox(width: 50.0),
                  ]),
              DropdownButton<double>(
                  items: [
                    DropdownMenuItem(
                      child: Text('+'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text('-'),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text('*'),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text('/'),
                      value: 4,
                    ),
                  ],
                  onChanged: (double value) {
                    setState(() {});
                    if (value == 1) {
                      a = '+';
                    } else if (value == 2) {
                      a = '-';
                    } else if (value == 3) {
                      a = '*';
                    } else if (value == 4) {
                      a = '/';
                    }
                  }),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(child: Text("Cal"), onPressed: all),
                    RaisedButton(
                      child: Text("Clear"),
                      onPressed: () {
                        _num1controller.clear();
                        _num2controller.clear();
                        _num3controller.clear();
                        _num4controller.clear();
                      
                      },
                    ),
                  ]),
              SizedBox(
                height: 40,
              ),

              Text(
                'Answer(in decimal): $result',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void plus() {
    setState(() {
      num1 = double.parse(_num1controller.text);
      num2 = double.parse(_num2controller.text);
      num3 = double.parse(_num3controller.text);
      num4 = double.parse(_num4controller.text);
      result = ((num1 * num4) + (num3 * num2)) / (num2 * num4);
    });
  }

  void minus() {
    setState(() {
      num1 = double.parse(_num1controller.text);
      num2 = double.parse(_num2controller.text);
      num3 = double.parse(_num3controller.text);
      num4 = double.parse(_num4controller.text);
      result = ((num1 * num4) - (num3 * num2)) / (num2 * num4);
    });
  }

  void multiply() {
    setState(() {
      num1 = double.parse(_num1controller.text);
      num2 = double.parse(_num2controller.text);
      num3 = double.parse(_num3controller.text);
      num4 = double.parse(_num4controller.text);
      result = (num1 * num3) / (num2 * num4);
    });
  }

  void divide() {
    setState(() {
      num1 = double.parse(_num1controller.text);
      num2 = double.parse(_num2controller.text);
      num3 = double.parse(_num3controller.text);
      num4 = double.parse(_num4controller.text);
      result = (num1 * num4) / (num3 * num2);
    });
  }

  void all() {
    setState(() {
      if (a == '+') {
        plus();
      } else if (a == '-') {
        minus();
      } else if (a == '*') {
        multiply();
      } else if (a == '/') {
        divide();
      }
    });
  }
}
