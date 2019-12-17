import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget> [IconButton(
          icon: Icon(
            Icons.update,
            color: Colors.white,
          ),
          onPressed: null,
        )]
      ),
      backgroundColor: Colors.indigo[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 0.0,
              ),
              height: 500.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 120.0,
                      color: Colors.indigo,
                    ),
                  ),
                  TextField(
                    maxLines: 1,
                    maxLength: 5,
                    decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      hintText: "18,43",
                    ),
                    autofocus: true,
                  ),
                  TextField(
                    maxLines: 1,
                    maxLength: 3,
                    decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      hintText: "176",
                    ),
                    autofocus: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: RaisedButton(
                      textColor: Colors.white,
                      onPressed: () => null,
                      color: Colors.indigo,
                      child: Text(
                        "Calcular IMC",
                      ),
                    ),
                  ),
                  Text(
                    "25.9",
                    style: TextStyle(

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
