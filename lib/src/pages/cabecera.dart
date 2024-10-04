import 'package:app/src/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: const Text('APLICACION MOVIL D LOPEZ'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                      margin: new EdgeInsets.symmetric(vertical: 15.0),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 6,
                      color: Colors.black,
                      child: Image(image: AssetImage("assets/images.png"))),
                  FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()));
                      },
                      child: const Text('LOGIN')),
                  FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()));
                      },
                      child: const Text('Dasboard')),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.width / 6,
                    color: Colors.grey,
                    child: Text("INICIO"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.width / 6,
                    color: Colors.grey,
                    child: Text("CONOCENOS"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.width / 6,
                    color: Colors.grey,
                    child: Text("CATALOGO"),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.width / 2,
                    color: Colors.black,
                    child: Image(
                        image: AssetImage("assets/MODELOS-[Recuperado]2.gif")),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    color: Colors.black,
                    child: Image(
                        image: AssetImage(
                            "assets/9710-airam-burga--sneakers-sandy.jpg")),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    color: Colors.black,
                    child: Image(
                        image: AssetImage(
                            "assets/9710-airam-burga--sneakers-sandy.jpg")),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
