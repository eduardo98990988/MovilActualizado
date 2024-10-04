import 'package:app/src/pages/Inicio/inicio.dart';
import 'package:app/src/pages/productos/producAdapter.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


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
        // useMaterial3: true,
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
  String path =
      'https://97530b76-8a90-48e8-8144-eebd52f237d3-00-2m6aql5yo8a1p.picard.repl.co/datos.json';

 
  final claveCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  //DECLARACION DE VARIABLES
  final usuarioCtrl = TextEditingController();
final contraCtrl = TextEditingController();
  //
  Future<void> sendPostRequest(email, password) async {
    var response = await http.post(Uri.parse("https://localhost:7282/api/Auth"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"usuario": email, "password": password}));

    if (response.statusCode == 200) {
      print("objectx");
    } else {
      print("objecty");
    }
  }

  submitData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("Valido");
      print(usuarioCtrl.text);
      print(contraCtrl.text);
      await sendPostRequest(usuarioCtrl.text, contraCtrl.text);
     Navigator.push(
            context, MaterialPageRoute(builder: (context)=>const HomeInicio()));
    } else {
      print("Invalido");
    }
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
        title: const Text('Flutter Demo Click Counter'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (String? value) {
                    return (value != null && value.isEmpty)
                        ? 'Por favor Ingresa al Usuario'
                        : null;
                  },
                  controller: usuarioCtrl,
                  decoration: InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                TextFormField(
                  validator: (String? value) {
                    return (value != null && value.isEmpty)
                        ? 'Por favor Ingresa la contraseña'
                        : null;
                  },
                  controller: contraCtrl,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                
                  
                
                ElevatedButton(
                    onPressed: () => submitData(context), child: Text("Registrar")),
                
              ],
            )),
      ),
     
    );
  }
}
