import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalculatorPlus',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculator Plus'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand  = "";


  buttonPressed(String buttonText){

    print(buttonText);
    if(buttonText == "CLEAR"){
      
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand  = "";



    } else if(buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";


    } else if(buttonText == "."){

      if(_output.contains(".")){
        print("Alreedy contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }


    }else if(buttonText == "="){
      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
     operand = "";

    }else{
      _output = _output + buttonText;
    }

    

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });

  }


  Widget buildButton(String buttonText){
    return new Expanded(
      child: new  OutlineButton(
      child: new Text(buttonText ,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
      padding: EdgeInsets.all(24.0),
      onPressed: () => 
        buttonPressed(buttonText)
      ,
      ),
    );
  } 

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new Container(
          child: new Column(children: <Widget>[


          new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
            ),
            child: new Text(output , style: new TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold
            ))),

            new Expanded(
              child: new Divider(),
            ),

           new Column( children: [
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ]),
              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X"),
              ]),
              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ]),
              new Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ]),
              new Row(children: [
                buildButton("CLEAR"),
                buildButton("="),
              
              ])
           ]),
          ]
          ),
      ),
    );
  }
}
