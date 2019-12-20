import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: AfterSplash(),
        backgroundColor: Colors.indigo,
        title: Text(
          "Calculadora de IMC",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
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

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados acima para obter o seu Índice de Massa Corpórea.";
  String _resultText = "";

  void imcCalc(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double result = weight / (height * height);
      if (result < 18.5){
        _infoText = "Abaixo do Peso";
        _resultText = "${result.toStringAsPrecision(4)}";
      } else if (18.5 <= result && 24.9 >= result){
        _infoText = "Peso Ideal";
        _resultText = "${result.toStringAsPrecision(4)}";
      } else if (25.0 <= result && 29.9 >= result){
        _infoText = "Sobrepeso";
        _resultText = "${result.toStringAsPrecision(4)}";
      } else if (30.0 <= result && 39.9 >= result){
        _infoText = "Obesidade";
        _resultText = "${result.toStringAsPrecision(4)}";
      } else if (40 <= result){
        _infoText = "Obesidade Grave";
        _resultText = "${result.toStringAsPrecision(4)}";
      } else {
        _infoText = "Insira dados válidos.";
      }
    });
  }

  void resetField(){
    weightController.text = "";
    heightController.text = "";
    _infoText = "Informe seus dados acima para obter o seu Índice de Massa Corpórea.";
    _resultText = "- -";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget> [
          IconButton(
            icon: Icon(
              Icons.update,
              color: Colors.white,
            ),
          onPressed: resetField,
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
                    controller: weightController,
                    maxLines: 1,
                    maxLength: 5,
                    decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      hintText: "Ex: 78.43",
                    ),
                    autofocus: false,
                  ),
                  TextField(
                    controller: heightController,
                    maxLines: 1,
                    maxLength: 3,
                    decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      hintText: "Ex: 176",
                    ),
                    autofocus: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: RaisedButton(
                      textColor: Colors.white,
                      autofocus: true,
                      onPressed: (){
                        imcCalc();
                      },
                      color: Colors.indigo,
                      child: Text(
                        "Calcular IMC",
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _infoText,
                        style: TextStyle(

                        ),
                      ),
                      Text(
                        _resultText,
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
