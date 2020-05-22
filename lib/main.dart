import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String temp = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = "";
  void apply(String pressed) {
    if (pressed == "CLEAR") {
      operation = "";
      temp = "0";
      num1 = 0.0;
      num2 = 0.0;
    }
    else if(pressed=="+" || pressed=="-" || pressed=="*" || pressed=="/")
    {
      num1 = double.parse(output);
      operation = pressed;
      temp = "0";
    }
    else if(pressed==".")
    {
      if(temp.contains("."))
      {
        return ;
      }
      else
      {
        temp+=pressed;
      }
    }
    else if(pressed=="ANS")
    {
      num2 = double.parse(output);
      if(operation=="+")
      {
        temp = (num1+num2).toString();
      }
      else if(operation=="-")
      {
        temp = (num1-num2).toString();
      }
      else if(operation=="*")
      {
        temp = (num1*num2).toString();
      }
      else
      {
        temp = (num1/num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operation = "";
    }
    else
    {
      temp+=pressed;
    }
    
    setState(() {
      output = double.parse(temp).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String number) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          number,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => apply(number),
        color: Colors.lightGreen,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24.0,
                ),
                child: new Text(
                  output,
                  style: new TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Expanded(
                child: new Divider(),
              ),
              Column(
                children: [
                  new Row(children: [
                    buildbutton("1"),
                    buildbutton("2"),
                    buildbutton("3"),
                    buildbutton("+"),
                  ]),
                  new Row(children: [
                    buildbutton("4"),
                    buildbutton("5"),
                    buildbutton("6"),
                    buildbutton("-"),
                  ]),
                  new Row(children: [
                    buildbutton("7"),
                    buildbutton("8"),
                    buildbutton("9"),
                    buildbutton("*"),
                  ]),
                  new Row(children: [
                    buildbutton("."),
                    buildbutton("0"),
                    buildbutton("00"),
                    buildbutton("/"),
                  ]),
                  new Row(children: [
                    buildbutton("CLEAR"),
                    buildbutton("ANS"),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
