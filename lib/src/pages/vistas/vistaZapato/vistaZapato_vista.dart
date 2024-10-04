import 'package:app/src/pages/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VistaZapato(),
    );
  }
}

class VistaZapato extends StatefulWidget {
  const VistaZapato({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<VistaZapato> {
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
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 100.0,
                    width: 100,
                    child: Image.asset('assets/images.png'),
                  ),
                  const Text("Iniciar sesion"),
                  FloatingActionButton(
                      child: Icon(Icons.verified_user_sharp),
                      backgroundColor: Colors.red,
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()))
                          }),
                  const Text("Carrito"),
                  FloatingActionButton(
                      child: Icon(Icons.verified_user_sharp),
                      backgroundColor: Colors.red,
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()))
                          }),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Image(
                            image: const NetworkImage(
                                "https://aa.somee.com/img_producto/sandalia&Negra")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const Text("Zapatos "),
                            const Text("para Caballeros"),
                            const Text("Precio "),
                            const Text(" 250"),
                            const Text("Tallas Disponibles "),
                            const Text(": 36 35 36"),
                          ],
                        ),
                      ),
                      FilledButton(
                          onPressed: () => {}, child: const Text("Ver")),
                      SizedBox.fromSize(
                        size: Size(56, 56), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.green, // button color
                            child: InkWell(
                              splashColor: Colors.lightGreen, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add, color: Colors.white), // icon
                                  Text("Añadir"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Image(
                            image: const NetworkImage(
                                "https://aa.somee.com/img_producto/sandalia&Negra")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const Text("Zapatos Marron"),
                            const Text("para Caballeros"),
                            const Text("Precio "),
                            const Text(" 300"),
                            const Text("Tallas Disponibles "),
                            const Text(": 36 35 36"),
                          ],
                        ),
                      ),
                      FilledButton(
                          onPressed: () => {}, child: const Text("Ver")),
                      SizedBox.fromSize(
                        size: Size(56, 56), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.green, // button color
                            child: InkWell(
                              splashColor: Colors.lightGreen, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add, color: Colors.white), // icon
                                  Text("Añadir"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Image(
                            image: const NetworkImage(
                                "https://aa.somee.com/img_producto/sandalia&Negra")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const Text("Zapatos "),
                            const Text("para Caballeros"),
                            const Text("Precio "),
                            const Text(" 250"),
                            const Text("Tallas Disponibles "),
                            const Text(": 36 35 36"),
                          ],
                        ),
                      ),
                      FilledButton(
                          onPressed: () => {}, child: const Text("Ver")),
                      SizedBox.fromSize(
                        size: Size(56, 56), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.green, // button color
                            child: InkWell(
                              splashColor: Colors.lightGreen, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add, color: Colors.white), // icon
                                  Text("Añadir"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Image(
                            image: const NetworkImage(
                                "https://aa.somee.com/img_producto/sandalia&Negra")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const Text("Zapatos Marron"),
                            const Text("para Caballeros"),
                            const Text("Precio "),
                            const Text(" 300"),
                            const Text("Tallas Disponibles "),
                            const Text(": 36 35 36"),
                          ],
                        ),
                      ),
                      FilledButton(
                          onPressed: () => {}, child: const Text("Ver")),
                      SizedBox.fromSize(
                        size: Size(56, 56), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.green, // button color
                            child: InkWell(
                              splashColor: Colors.lightGreen, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add, color: Colors.white), // icon
                                  Text("Añadir"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
